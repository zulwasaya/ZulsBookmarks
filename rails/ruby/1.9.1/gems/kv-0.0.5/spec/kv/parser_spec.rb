require 'spec_helper'

describe KV::Parser do
  let(:parser) { KV::Parser.new }

  it 'parses a single pair' do
    parser.handle('foo=bar').should eq({"foo" => "bar"})
  end

  it 'should handle multiple pairs' do
    parser.handle('foo=bar a=b').should eq({"a" => "b", "foo" => "bar"})
  end

  it 'should reject non-pairs' do
    parser.handle('hi!').should eq({})
  end

  it 'should handle integers properly' do
    parser.handle('a=1').should eq({"a" => 1})
  end

  it 'should handle floats properly' do
    parser.handle('a=1.1').should eq({"a" => 1.1})
  end

  it 'should be careful with things that are not really floats' do
    parser.handle('ip=10.10.10.10').should eq({'ip' => '10.10.10.10'})
  end
end

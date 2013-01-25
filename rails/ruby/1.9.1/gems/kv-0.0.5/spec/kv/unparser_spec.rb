require 'spec_helper'

describe KV::Unparser do
  let(:unparser) { KV::Unparser.new }

  it "converts a hash into a string" do
    unparser.handle({"a" => 1, "foo" => "bar"}).should eq("a=1 foo=bar")
  end
end

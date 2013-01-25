require 'spec_helper'

describe KV do
  it "parses a string" do
    KV.parse("a=b").should eq({"a" => "b"})
  end

  it "unparses a hash" do
    KV.unparse(:a => 1).should eq("a=1")
  end
end

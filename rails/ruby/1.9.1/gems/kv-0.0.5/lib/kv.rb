require 'kv/parser'
require 'kv/unparser'
require 'kv/version'

module KV
  def self.parse(s)
    Parser.new.handle(s)
  end

  def self.unparse(h)
    Unparser.new.handle(h)
  end
end

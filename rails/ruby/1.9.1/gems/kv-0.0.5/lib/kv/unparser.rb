module KV
  class Unparser
    def handle(h)
      h.reject{ |k,v| v.nil? }.map { |k,v| "#{k}=#{v}" }.join(" ")
    end
  end
end

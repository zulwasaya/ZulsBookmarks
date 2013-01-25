module KV
  class Parser
    def parse_value(v)
      if v.match(/^\d+\.\d+$/)
        v.to_f
      elsif v.match(/^\d+$/)
        v.to_i
      else
        v
      end
    end

    def handle(s)
      words = to_words(s)
      a = words.map { |a| to_pairs(a) }.reject { |a| a.nil? }.flatten
      Hash[*a]
    end

    def to_pairs(words)
      a = words.split('=')
      if a.size != 2
        nil
      else
        [a.first, parse_value(a.last)]
      end
    end

    def to_words(s)
      s.split(' ')
    end
  end
end

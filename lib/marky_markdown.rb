require "marky_markdown/version"

module MarkyMarkdown
  class Transformer
    def self.transform(str)
      variable_hash = self.identify_variables(str)
      self.compile({variables: variable_hash, body: str})
    end

    def self.identify_variables(str)
      shortened = Helpers.shorten_str(str)

      key_value_array = Helpers.split_str_by_returns(shortened).map do |v|
        v.split("=") unless v.strip.empty?
      end.compact

      Hash[key_value_array.map { |key, value| [key, value]  }]
    end

    def self.compile(input)
      input[:variables].each do |k, v|
        next if v.nil?

        key = "{{ #{k} }}"
        occurences = Helpers.count_occurences_for(key, input[:body])

        occurences.times do
          input[:body] [key] = v if input[:body].include? key
        end
      end

      input[:body]
    end
  end

  class MarkyMarkdown::Helpers
    def self.shorten_str(str)
      str.slice(str.index('#') + 1..(str.index('$') - 1))
    rescue StandardError => e
      puts e.message
      puts e.backtrace.inspect
    end

    def self.split_str_by_returns(str)
      str.split("\r\n")
    rescue StandardError => e
      puts e.message
      puts e.backtrace.inspect
    end

    def self.count_occurences_for(key, body)
      length = key.length
      body.count(key) / length
    end
  end
end

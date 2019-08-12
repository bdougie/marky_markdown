require "marky_markdown/version"

module MarkyMarkdown
  class Transformer
    def self.transform(str)
      variable_hash = self.identify_variables(str)
      self.find_and_replace({variables: variable_hash, body: str})
    end

    def self.identify_variables(str)
      shortened = Helpers.shorten_str(str)

      key_value_array = Helpers.split_str_by_returns(shortened).map do |v|
        v.split("=") unless v.strip.empty?
      end

      Hash[key_value_array.map { |key, value| [key, value] }]
    end

    def self.find_and_replace(input)
      input[:variables].each do |k, v|
        next if v.nil?

        key = "{{ #{k} }}"
        input[:body] [key] = v if input[:body].include? key
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
  end
end

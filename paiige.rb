class Paiige
  def initialize
    @dict = MarkyMarkov::Dictionary.new(DICTIONARY_NAME)
  end

  def parse(str)
    puts "PARSE: #{str}"
    @dict.parse_string str
    @dict.save_dictionary!
  end

  def generate
    g = @dict.generate_1_sentence.strip
    puts "GENERATE: #{g}"
    g
  end
end
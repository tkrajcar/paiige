class Paiige
  def initialize
    @dict = MarkyMarkov::Dictionary.new(DICTIONARY_NAME)
  end

  def parse(str)
    puts "PARSE: #{str}"
    @dict.parse_string str
    @dict.save_dictionary!
  end

  def generate(phrase = nil)
    g = @dict.generate_sentence_with_phrase(phrase).strip
    puts "GENERATE: #{g}"
    g
  end
end
class Word
attr_reader :word

  def initialize
    @word_bank = ["athletics", "baseball", "basketball", "bowling", "car", "racing", "cycling", "football", "golf", "gymnastics", "handball", "hang", "gliding", "hockey", "horse", "racing", "jogging", "motorcycle", "racing", "para", "gliding", "polo", "rugby", "scuba", "diving", "skiing", "skin", "diving", "snowboarding", "soccer", "softball", "squash", "swimming", "table", "tennis", "tennis", "volleyball"]
  end

  def word_random
    @word_bank.sample.split("")
  end

end

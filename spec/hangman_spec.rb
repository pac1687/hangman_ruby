require 'rspec'
require 'word'

describe Word   do
  it 'initializes an instance of a word'do
  test_word = Word.new("athletics")
  expect(test_word).to be_an_instance_of Word
  end
end

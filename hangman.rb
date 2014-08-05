require './lib/word'
require 'pry'

@wrong_letters = []

def game_menu
  loop do
    puts "*** Welcome to Hangman ***"
    puts "Press 'n' to start a new game"
    puts "Press 'x' to exit"
    menu_choice = gets.chomp
    if menu_choice == 'n'
      new_game_ui
    elsif menu_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def new_game_ui
  puts "Choose level of difficulty"
  puts "[e] Easy"
  puts "[n] Normal"
  puts "[h] Hard"
  @difficulty = gets.chomp
    if @difficulty == "e"
      @difficulty = "Easy"
      # @easy = 9
    elsif @difficulty == "n"
      @difficulty = "Normal"
      # @normal = 6
    elsif @difficulty == 'h'
      @difficulty = "Hard"
      # @hard = 3
    end
  puts "Level: #{@difficulty}"
  puts "Guess this word \n"
  @guess_word = Word.new.word_random
  @revealed = @guess_word.join
  word_size = @guess_word.length
  @secret_word = ("_" * word_size).split("")
  print @secret_word
  # binding.pry
  letter_search
end

def letter_search
    # binding.pry
  puts "Pick a letter \n"
  @user_choice = gets.chomp
  letter_test = @guess_word.each_index.select {|letter| @guess_word[letter] == @user_choice}
  if letter_test == []
    @wrong_letters << @user_choice
    puts "*** Wrong Letters: #{@wrong_letters} ***"
    print "#{@secret_word} \n\n"
    if @difficulty == "Hard" && @wrong_letters.length == 3
      puts "You lose! \n"
      puts "The correct word was '#{@revealed}'\n\n"
      @wrong_letters = []
      game_menu
    elsif @difficulty == "Normal" && @wrong_letters.length == 6
      puts "You lose! \n"
      puts "The correct word was '#{@revealed}'\n\n"
      @wrong_letters = []
      game_menu
    elsif @difficulty == "Easy" && @wrong_letters.length == 9
      puts "You lose! \n"
      puts "The correct word was '#{@revealed}'' \n\n"
      @wrong_letters = []
      game_menu
    else
    puts "Sorry, try again \n\n"
    letter_search
    end
  else
    letter_test.each {|letter| @secret_word[letter].replace(@user_choice)}
    puts "*** Wrong Letters: #{@wrong_letters} ***"
    print @secret_word
    if @secret_word == @guess_word
      puts "You win! \n\n"
      @wrong_letters = []
      game_menu
    else
    letter_search
  end
end



end
game_menu

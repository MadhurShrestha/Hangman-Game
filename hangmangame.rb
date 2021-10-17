# require "json"
class Hangman


  def initialize
    @secret_word = select_word
    @display = "#" * @secret_word.length
    @failed_attempts = 0
  end

  def main_menu
      puts "***Welcome to the hangman game***"
    start_game
  end

  def start_game
    player_won = false
    while @failed_attempts != 7
      puts @display
      puts "#{7- @failed_attempts.to_i} turns remaining."
      print "Enter a letter from a to z consisting of #{@secret_word.length} words.:"
      letters = gets.chomp

      update_display(letters) if letters
      player_won = player_won?
      break if player_won
    end
    puts "Game over, the secret word was: #{@secret_word}" if @failed_attempts == 7
  end

    def select_word
    words = File.readlines("text.txt").select { |word| word.length}
    words[rand(words.length)].strip
  end


  def update_display(letters)
    letters.downcase
    current_state = "#{@display}"
    if letters.length == 1
      @display.length.times do |index|
      @display[index] = letters if @secret_word[index].downcase == letters
      end
    else
      @display = letters if letters == @secret_word.downcase
    end

    current_state == @display ? print_display(1) : print_display(0)
  end

  def player_won?
    unless @display.include?("#")
      puts "You guessed it correctly.The correct answer was #{@secret_word}."
      puts "⠀⠀⠀⣴⠉⡙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⣚⡯⠴⢬⣱⡀⠀
⠀⠀⠀⠀⢰⡇⣷⡌⢲⣄⡑⢢⡀⠀⠀⠀⠀⠀⢠⠾⢋⠔⣨⣴⣿⣷⡌⠇⡇⠀
⠀⠀⠀⠀⢸⢹⣿⣿⣄⢻⣿⣷⣝⠷⢤⣤⣤⡶⢋⣴⣑⠟⠿⠿⠿⣿⣿⡀⡇⠀
⠀⠀⠀⠀⢸⢸⣿⡄⢁⣸⣿⣋⣥⣶⣶⣶⣶⣶⣶⣿⣿⣶⣟⡁⠚⣿⣿⡇⡇⠀
⢀⣠⡤⠤⠾⡘⠋⢀⣘⠋⠉⠉⠉⠉⢭⣭⣭⣭⣍⠉⢩⣭⠉⠉⠂⠙⠛⠃⣇⡀
⠏⠀⠀⢿⣿⣷⡀⠀⢿⡄⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣆⠀⢿⣇⠀⠀⠀⠀⠀⠀⠈⢱
⣦⠀⠀⠈⢿⣿⣧⠀⠘⣿⠀⠀⠀⡀⠀⠀⠘⣿⣿⣿⣿⡆⠀⢻⡆⠀⠀⠀⠀⠀⠀⢸
⢻⡄⠀⠀⠘⠛⠉⠂⠀⠙⠁⠀⣼⣧⠀⠀⠀⠈⠀⠀⠈⠙⠀⠘⠓⠀⠀⠀⠀⠀⢀⡟
⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣏⠀
⠀⠀⠛⢶⢰⣶⢢⣤⣤⣄⠲⣶⠖⠀⣙⣀⠀⠀⠀⠤⢤⣀⣀⡀⣀⣠⣾⠟⡌⠀
⠀⠀⠀⠘⢄⠃⣿⣿⣿⣿⠗⠀⠾⢿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⠸⠟⣡⣤⡳⢦
⠀⠀⠀⠀⠀⢻⡆⣙⡿⢷⣾⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⡿⠟⢡⣴⣾⣿⣿⣿⣦
⠀⠀⠀⠀⠀⡼⢁⡟⣫⣶⣍⡙⠛⠛⠛⠛⠛⣽⡖⣉⣠⣶⣶⣌⠛⢿⣿⣿⣿⣿
⠀⠀⠀⢀⠔⢡⢎⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿⣿⣿
⠀⢠⠖⢁⣴⡿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⣿⣿ "
      true
    end
  end

  def print_display(increment)
    @failed_attempts += increment

    case @failed_attempts
    when 0
      puts "            "
    when 1
      puts "+---+---+--"
      puts "    .....   "
      puts "    (   )   "
      puts "    (   )   "
      puts "    (   )   "
      puts "    .....   "

    when 2
      puts "+---+---+---"
      puts "    .....    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "


    when 3
      puts "+---+---+---"
      puts "    .....    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "     /|     "
      puts "    / |     "
      puts "   /  |     "
      puts "      |     "
      puts "      |     "
      puts "      |     "

    when 4
      puts "+---+---+---"
      puts "    .....    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "            "

    when 5
      puts "+---+---+---"
      puts "    .....    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    (   )     "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "
      puts "      |     "
      puts "     /|     "
      puts "    / |     "
      puts "   /  |     "

    when 6
      puts "+---+---+---"
      puts "    .....    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    (   )    "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "

    when 7
      puts "+---+---+---"
      puts "    .....    "
      puts "    ( X  )    "
      puts "    ( X  )    "
      puts "    ( X  )    "
      puts "    .....    "
      puts "      |     "
      puts "      |     "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "
      puts "      |     "
      puts "     /|\\    "
      puts "    / | \\   "
      puts "   /  |  \\  "

    end
    puts ""
  end

end


my_game = Hangman.new
my_game.main_menu

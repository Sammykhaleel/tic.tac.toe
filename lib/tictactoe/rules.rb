module TicTacToe
  module Rules
      def greeting
          # Greeting
          puts '#####################################################################'
          puts " "
          @computer_name = "Master"
          puts "Hello, my name is #{@computer_name} and welcome to the BeenVerified TIC-TAC-TOE challenge!"
          puts ""
          puts "Before we get started, what is your name?"
          @user_name = gets.chomp
          puts '------------------------------------------------------------------'
          puts "Nice to meet you #{@user_name.capitalize}, I don't plan to take it easy on you! so get ready."
      end
      
      def instructions
          puts '------------------------------------------------------------------'
          puts "#{@user_name}: #{@user}"
          puts " VS."
          puts "#{@computer_name}: #{@computer}"
          puts '------------------------------------------------------------------'
          puts "The game rules"
          puts 'Two players, X and O who take turns marking the spaces in a 3×3 grid.'
          puts "The player who succeeds in placing three respective marks in a horizontal, vertical, or diagonal row wins the game. "
          puts "The following example game is won by the first player, X:"
          puts ""
          puts "   x|x|x       | |       | |       x| |      |x|       | |x    x| |     | |x  "
          puts '   ------     ------     ------    ------   ------    ------   ------  ------ '
          puts "    | |       x|x|x      | |       x| |      |x|       | |x     |x|     |x|   "
          puts '   ------     ------     ------    ------   ------    ------   ------  ------ '
          puts "    | |        | |      x|x|x      x| |      |x|       | |x     | |x   x| |   "
          puts ""
          puts 'Directions: make a move by entering the letter & number representing'
          puts "the slot you're trying to fill. For example, 'a1' , 'b2', 'c3', etc."
      end
      
    end
end

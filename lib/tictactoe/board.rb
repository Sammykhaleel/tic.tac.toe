require_relative "./rules"
require_relative "./engine"
module TicTacToe
  class Board
      include TicTacToe::Rules
      include TicTacToe::Engine
      attr_accessor :slots, :win_combos
      
      def initialize()
          # Possible moves on the board
          @slots = {
              "a1"=>" ", "a2"=>" ", "a3"=>" ",
              "b1"=>" ", "b2"=>" ", "b3"=>" ",
              "c1"=>" ", "c2"=>" ", "c3"=>" ",
          }
          
          # Possible winning combinations
          @win_combos = [
          ['a1', 'a2', 'a3'],
          ['b1', 'b2', 'b3'],
          ['c1', 'c2', 'c3'],
          
          ['a1', 'b1', 'c1'],
          ['a2', 'b2', 'c2'],
          ['a3', 'b3', 'c3'],
          
          ['a1', 'b2', 'c3'],
          ['c1', 'b2', 'a3']
          ]
          
          @user = 'X'
          @computer = 'O'
          @computer_name = "Master"
          
    greeting
    instructions
    user_move
    computer_move
              
      end
      
      def draw_board
          show_board
      end
      
      def show_board
          puts '******************************************************************'
          puts "   a b c"
          puts ' '
          puts " 1 #{@slots["a1"]}|#{@slots["b1"]}|#{@slots["c1"]}"
          puts '   ------'
          puts " 2 #{@slots["a2"]}|#{@slots["b2"]}|#{@slots["c2"]}"
          puts '   ------'
          puts " 3 #{@slots["a3"]}|#{@slots["b3"]}|#{@slots["c3"]}"
          puts '------------------------------------------------------------------'
      end

  end
end

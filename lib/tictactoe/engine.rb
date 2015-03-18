module TicTacToe
  module Engine
      
      def user_move
          draw_board
          puts "#{@user_name.upcase} are you ready? please make your move."
          move = gets.chomp.downcase
          
          #handling the errors.
          return wrong_input unless move.length == 2
          x = move.split("")
          if(['a','b','c'].include? x[0])
              if(['1','2','3'].include? x[1])
                  if @slots[move] == " "
                      @slots[move] = @user
                      puts '******************************************************************'
                      puts "#{@user_name} marks #{move}"
                      else
                      wrong_move
                  end
                  else
                  wrong_input
              end
              else
              wrong_input
          end
          draw_board
          computer_move
      end
      
      def wrong_input
          puts "**************************************************************"
          puts "Please specify a move with the format 'a1' , 'b3' , 'c2' etc."
          puts "**************************************************************"
          user_move
      end
      
      def wrong_move
          puts "**************************************************************"
          puts "You must choose an empty slot"
          puts "**************************************************************"
          user_move
      end
      
      def moves_remaining
          slots = 0
          @slots.each do |key, value|
              slots += 1 if value == " "
          end
          slots
      end
      
      def computer_move
          # if
          # need to write method to look for a corner
          move = find_move
          @slots[move] = @computer
          puts '******************************************************************'
          puts "#{@computer_name} marks #{move}"
          check_board(@user)
          # else
          #   # checks to see if middle is open for block
          #   middle_block
          # end
      end
      
      def find_move
          # check to see if computer can win
          # check to see if any slots already have 2 filled by computer
          @win_combos.each do |option|
              if times_in_slot(option, @computer) == 2
                  return empty_slot option
              end
          end
          
          # check to see if user can win
          # check to see if any slots already have 2 filled by user
          @win_combos.each do |option|
              if times_in_slot(option, @user) == 2
                  return empty_slot option
              end
          end
          
          #see if any slots already have 1 filled by computer
          @win_combos.each do |option|
              if times_in_slot(option, @computer) == 1
                  return empty_slot option
              end
          end
          
          # no strategic moves available, selects any open slot
          random_move
      end
      
      def random_move
          key = @slots.keys;
          move = rand(key.length)
          if @slots[key[move]] == " "
              return key[move]
              else
              @slots.each { |key,value| return key if value == " "}
          end
      end
      
      def times_in_slot slot, letter
          times = 0
          slot.each do |x|
              times += 1 if @slots[x] == letter
              unless @slots[x] == letter || @slots[x] == " "
                  return 0
              end
          end
          times
      end
      
      def empty_slot slot
          slot.each do |x|
              if @slots[x] == " "
                  return x
              end
          end
      end
      
      def check_board(next_move)
          
          game_over = nil
          
          @win_combos.each do |slot|
              # check to see if computer has won
              if times_in_slot(slot, @computer) == 3
                  puts "GAME OVER... #{@computer_name} always wins!"
                  game_over = true
                  show_board
              end
              
              # check to see if user has won
              if times_in_slot(slot, @user) == 3
                  puts "GAME OVER... #{@user_name} wins...I've made a terrible mistake!"
                  game_over = true
                  show_board
              end
          end
          
          unless game_over
              if(moves_remaining > 0)
                  if(next_move == @user)
                      user_move
                      else
                      computer_move
                  end
                  else
                  puts "You are getting food at it, try agian!"
              end
          end
      end
  end
end

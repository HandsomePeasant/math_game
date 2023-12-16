require './player'

class Game

  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2].shuffle
  end

  def display_lives
    if game_over? == false
    sleep 1
    puts
    puts "--------------------"
    puts "    Current Lives    "
    puts
    puts "#{@player1.name}: #{@player1.lives}/3    #{@player2.name}: #{@player2.lives}/3"
    puts
    puts "--------------------"
    end
  end

  def new_turn
    sleep 0.8
    @players.rotate!
    if game_over? == false
    puts "----- NEW TURN -----"
    end
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def play_game
    puts "--------------------"
    puts
    puts "-----GAME START-----"
    puts
    until game_over? do
      current_player = @players.first
      num1 = rand(20) + 1
      num2 = rand(20) + 1
      answer = num1 + num2

      puts "--------------------"
      puts
      puts "#{current_player.name}: what is #{num1} plus #{num2}?"
      puts
      puts ">"
      player_answer = gets.chomp
      if player_answer.to_i == answer
        sleep 0.3
        puts
        puts "--------------------"
        puts
        puts "Correct! Great job!"
        puts
        puts "--------------------"
      else
        sleep 0.3
        puts
        puts "--------------------"
        puts
        puts "Oof! Incorrect!"
        puts
        puts "--------------------"
        current_player.lives -= 1
      end
      display_lives
      new_turn
    end

    if @player1.lives == 0
      puts
      puts "Sorry #{@player1.name}, you're out of lives! Which means..."
      puts
      sleep 1
      puts "Player 2 wins! Their final life total: #{@player2.lives}/3"
      puts
      puts "----- Game Over -----"
    elsif @player2.lives == 0
      puts
      puts "Sorry #{@player2.name}, you're out of lives! Which means..."
      puts
      sleep 1
      puts "Player 1 wins! Their final life total: #{@player1.lives}/3"
      puts
      puts "----- Game Over -----"
    end
  end

end
require 'pry'
require_relative 'board'
require_relative 'player'
require_relative 'boardcase'

class Game < Board
  attr_accessor :players, :board, :current_player
   
  def initialize(player1, player2)
    @board = Board.new

    @players = []

    #va créer nos deux joueurs et les mettre dans un array
    @current_player = Player.new(player1, "O", 0)
    @players << @current_player
    @current_player = Player.new(player2, "X", 0)
    @players << @current_player

  end

  def score 
    puts "--__ TABLEAU DES SCORES __--"
    puts "#{players[0].name} a eu #{players[0].win} victoires !"
    puts "#{players[1].name} a eu #{players[1].win} victoires !"
  end

  def turn
    
    loop do
      board.board_display

      puts "C'est au tour de : #{players[0].name}"
      board.play_turn("01")
      board.board_display

      if board.victory == "X"
        puts "Victoire pour #{players[0].name}!"
        players[0].win += 1
        break
      end

      if board.victory == "égalité"
        puts "NAZE! Egalité!"
        break
      end

      puts "C'est au tour de : #{players[1].name}"
      board.play_turn("02")
      board.board_display

      if board.victory == "O"
        puts "Victoire pour #{players[1].name}!"
        players[1].win +=1
        break
      end
    end
    print score
  end

  def new_round
    board.board_clean
  end

  def game_end
    puts "score final"
    print score
  end    
  
end
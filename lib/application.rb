require 'pry'
require_relative 'board'
require_relative 'player'
require_relative 'boardcase'
require_relative 'game'

class Application

  def start_game
    puts "---------------------------------------"
    puts "|              MORPION                 |"
    puts "---------------------------------------"
  end

  def ask_player1
    puts "quel est le nom du joueur 1 ? "
    player1 = gets.chomp
    puts "Tu auras les X"
    
  end

  def ask_player2
    puts "quel est le nom du joueur 2 ? "
    player2 = gets.chomp
    puts "Tu auras les O"
    return player2
  end

  def ask_again(game)
    puts "Veux-tu rejouer ? y / n"
    input = gets.chomp
    while input != "y" || input != "n"
      case input
      when "y"
        game.new_round
        game.turn

      when "n"
        game.game_end
        break
      else
        puts "Veux-tu rejouer ? y / n"
        input = gets.chomp
      end
    end
  end

  def perform
    start_game
    player1 = ask_player1
    player2 = ask_player2

    game = Game.new(player1, player2) 
    game.turn

    ask_again(game)


  end
  
end
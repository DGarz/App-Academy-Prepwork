require 'byebug'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  
  attr_accessor :board, :current_player, :mark
  
  
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one.mark = :X
    @player_two.mark = :O
    @board = Board.new
    @current_player = @player_one
  end

  def play
    play_turn until @board.over?
    puts @board.winner
  end
  
  def play_turn
    #debugger
    @current_player.display(@board)
    pos = @current_player.get_move
    @board.place_mark(pos, @current_player.mark)
    switch_players!
    
    
  end  
  
  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end
end


if $PROGRAM_NAME == __FILE__
  me = HumanPlayer.new("David")
  comp = ComputerPlayer.new("Hal")
  Game.new(me, comp).play
end
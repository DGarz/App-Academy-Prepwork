class BattleshipGame
  
  attr_reader :board, :player
  
  def initialize(player = HumanPlayer.new("David"), board = Board.default_grid)
      @player = player
      @board = board
  end
  
  def attack(pos)
      @board[pos] = :x
  end
  
  def count
    @board.count
  end
  
  def game_over?
    @board.won?
  end
  
  def play_turn
    move = @player.get_play
    attack(move)
  end
      
end

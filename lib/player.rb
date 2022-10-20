class Player
  attr_reader :name, :symbol
  attr_accessor :win
    
  def initialize(name, symbol, win)
    @name = name
    @symbol = symbol
    @win = win
  end

end
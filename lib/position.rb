class Position < Struct.new(:x, :y, :orientation)
  attr_reader :x, :y, :orientation

  NORTH = :north

  def advance
    self
  end
end
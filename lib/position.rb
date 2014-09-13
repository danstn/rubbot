class Position < Struct.new(:x, :y, :orientation)
  NORTH = :north
  EAST  = :east
  WEST  = :west
  SOUTH = :south

  def advance
    case orientation
    when NORTH
      pos = Position.new(x, y + 1, orientation)
    when EAST
      pos = Position.new(x + 1, y, orientation)
    when WEST
      pos = Position.new(x - 1, y, orientation)
    when SOUTH
      pos = Position.new(x, y - 1, orientation)
    end
  end
end
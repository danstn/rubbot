class Position < Struct.new(:x, :y, :orientation)
  NORTH = :north
  EAST  = :east
  WEST  = :west
  SOUTH = :south

  def advance
    case orientation
    when NORTH
      Position.new(x, y + 1, orientation)
    when EAST
      Position.new(x + 1, y, orientation)
    when WEST
      Position.new(x - 1, y, orientation)
    when SOUTH
      Position.new(x, y - 1, orientation)
    end
  end

  def left
    rotate -1
  end

  def right
    rotate 1
  end

  private

  def rotate(by)
    facing_index = orientations.index(orientation)
    facing       = orientations.rotate(facing_index).rotate(by).first
    Position.new(x, y, facing)
  end

  def orientations
    [NORTH, EAST, SOUTH, WEST]
  end
end
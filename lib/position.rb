class Position < Struct.new(:x, :y, :orientation)
  NORTH = :north

  def advance
    case orientation
    when NORTH
      pos = Position.new(x, y + 1, orientation)
    end
  end
end
require 'grid'
require 'position'

class Robot
  attr_accessor :position

  def initialize(grid)
    @grid = grid
  end

  def position=(position)
    @position = position
  end

  def move
    @position = @position.advance if @position.advance.valid? @grid
  end

  def rotate_left
    @position = @position.left
  end

  def rotate_right
    @position = @position.right
  end
end
require 'grid'
require 'position'

class Robot
  attr_accessor :position

  def initialize(grid)
    @grid = grid
  end

  def move
    update_position @position.advance
  end

  def rotate_left
    update_position @position.left
  end

  def rotate_right
    update_position @position.right
  end

  private

  def update_position(new_position)
    @position = new_position if new_position.valid? @grid
  end
end
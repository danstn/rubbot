require 'grid'
require 'position'

class Robot
  attr_accessor :position

  def position=(position)
    @position = position
  end

  def move
    @position = @position.advance
  end
end
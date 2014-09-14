step "there is a grid :n by :m" do |n, m|
  @grid = Grid.new(n.to_i, m.to_i)
end

step "a robot" do
  @robot = Robot.new(@grid)
end

step "a robot placed at (:x,:y) facing :orientation" do |x, y, orientation|
  @robot = Robot.new(@grid)
  @robot.position = Position.new(x.to_i, y.to_i, Position.const_get(orientation.upcase))
end

step "the robot moves" do
  @robot.move
end

step "the robot turns left" do
  @robot.rotate_left
end

step "the robot turns right" do
  @robot.rotate_right
end

step "the robot should be at (:x,:y) facing :orientation" do |x, y, orientation|
  position = Position.new(x.to_i, y.to_i, Position.const_get(orientation.upcase))
  expect(@robot.position).to eq(position)
end

step "the robot should not be placed" do
  expect(@robot).to_not be_placed
end

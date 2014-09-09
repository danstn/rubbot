step "there is a grid :n by :m" do |n, m|
  @grid = Grid.new(n, m)
end

step "a robot placed at (:x,:y) facing north" do |x, y|
  @robot = Robot.new
  @robot.position = Position.new(x, y, Position::NORTH)
end

step "the robot moves" do
  @robot.move
end

step "the robot should be at (:x,:y) facing north" do |x, y|
  position = Position.new(x, y, Position::NORTH)
  expect(@robot.position).to eq(position)
end
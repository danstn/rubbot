step "there is a grid :n by :m" do |n, m|
  @grid = Grid.new(n.to_i, m.to_i)
end

step "a robot placed at (:x,:y) facing :orientation" do |x, y, orientation|
  @robot = Robot.new
  @robot.position = Position.new(x.to_i, y.to_i, Position.const_get(orientation.upcase))
end

step "the robot moves" do
  @robot.move
end

step "the robot should be at (:x,:y) facing :orientation" do |x, y, orientation|
  position = Position.new(x.to_i, y.to_i, Position.const_get(orientation.upcase))
  expect(@robot.position).to eq(position)
end
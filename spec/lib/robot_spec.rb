require 'robot'

describe Robot do

  describe "::new" do
    subject(:robot) { Robot.new }

    it "creates an instance of Robot" do
      expect(robot).to be_a Robot
    end
  end

  describe "#position" do
    subject(:robot) { Robot.new }

    it "sets a position" do
      robot.position = Position.new(1, 2, Position::WEST)
      expect(robot.position).to eq(Position.new(1, 2, Position::WEST))
    end
  end

  describe "#move" do
    subject(:robot) { Robot.new }

    it "changes the position of the robot" do
      robot.position = Position.new(0, 0, Position::NORTH)
      robot.move
      expect(robot.position).to eq(Position.new(0, 1, Position::NORTH))
    end
  end

  describe "#rotate_left" do
    subject(:robot) { Robot.new }

    it "rotates left" do
      robot.position = Position.new(0, 0, Position::NORTH)
      robot.rotate_left
      expect(robot.position).to eq(Position.new(0, 0, Position::WEST))
    end
  end

  describe "#rotate_right" do
    subject(:robot) { Robot.new }

    it "rotates right" do
      robot.position = Position.new(0, 0, Position::NORTH)
      robot.rotate_right
      expect(robot.position).to eq(Position.new(0, 0, Position::EAST))
    end
  end
end

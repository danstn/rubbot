require 'spec_helper'

describe RobotInterface do
  let(:grid) { Grid.new(5, 5) }
  let(:robot) { Robot.new(grid) }

  context "::Place" do
    it "sends robot a message to place itself" do
      cmd      = RobotInterface::Place.new(["0", "0", "NORTH"])
      position = Position.new(0, 0, Position::NORTH)
      expect(robot).to receive(:place).with(position)
      cmd.execute robot
    end
  end

  context "::Move" do
    it "sends robot a message to move" do
      cmd = RobotInterface::Move.new
      robot.place Position.new(0, 0, Position::NORTH)
      expect(robot).to receive(:move)
      cmd.execute robot
    end
  end

  context "::Left" do
    it "sends robot a message to rotate left" do
      cmd = RobotInterface::Left.new
      robot.place Position.new(0, 0, Position::NORTH)
      expect(robot).to receive(:rotate_left)
      cmd.execute robot
    end
  end

  context "::Right" do
    it "sends robot a message to rotate right" do
      cmd = RobotInterface::Right.new
      robot.place Position.new(0, 0, Position::NORTH)
      expect(robot).to receive(:rotate_right)
      cmd.execute robot
    end
  end

  context "::Report" do
    let(:stdout) { StringIO.new }

    it "sends robot a message to report" do
      cmd      = RobotInterface::Report.new
      robot.place Position.new(2, 3, Position::NORTH)
      cmd.execute(robot, output: stdout)
      expect(stdout.string.chomp).to eq('2,3,NORTH')
    end
  end
end


require 'spec_helper'

describe Robot do
  let(:grid) { Grid.new(5, 5) }

  describe "::new" do
    subject(:robot) { Robot.new(grid) }

    it "creates an instance of Robot" do
      expect(robot).to be_a Robot
    end
  end

  describe "#place" do
    subject(:robot) { Robot.new(grid) }

    it "sets a position" do
      robot.place Position.new(1, 2, Position::WEST)
      expect(robot.position).to eq(Position.new(1, 2, Position::WEST))
    end
  end

  describe "#move" do
    subject(:robot) { Robot.new(grid) }

    it "changes the position of the robot" do
      robot.place Position.new(0, 0, Position::NORTH)
      robot.move
      expect(robot.position).to eq(Position.new(0, 1, Position::NORTH))
    end
  end

  describe "#rotate_left" do
    subject(:robot) { Robot.new(grid) }

    it "rotates left" do
      robot.place Position.new(0, 0, Position::NORTH)
      robot.rotate_left
      expect(robot.position).to eq(Position.new(0, 0, Position::WEST))
    end
  end

  describe "#rotate_right" do
    subject(:robot) { Robot.new(grid) }

    it "rotates right" do
      robot.place Position.new(0, 0, Position::NORTH)
      robot.rotate_right
      expect(robot.position).to eq(Position.new(0, 0, Position::EAST))
    end
  end

  describe "#report" do
    subject(:robot) { Robot.new(grid) }

    context "when placed" do
      it "reports its current position" do
        robot.place Position.new(3, 4, Position::SOUTH)
        expect(robot.report).to eq("3,4,SOUTH")
      end
    end

    context "when not placed" do
      it "reports its current position" do
        expect(robot.report).to eq(Robot::UNPLACED_NOTICE)
      end
    end
  end

  describe "#placed?" do
    subject(:robot) { Robot.new(grid) }

    context "when placed" do
      let(:position) { Position.new(2, 2, Position::NORTH) }
      it "is placed" do
        robot.place position
        expect(robot.placed?).to be_truthy
      end
    end

    context "when placement is invalid" do
      let(:position) { Position.new(-2, 20, Position::NORTH) }
      it "is not placed" do
        robot.place position
        expect(robot.placed?).to be_falsy
      end
    end

    context "when not placed" do
      it "is not placed" do expect(robot.placed?).to be_falsy end
    end
  end
end

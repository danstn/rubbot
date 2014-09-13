require 'position'

describe Position do
  it "has NORTH orientation" do
    expect(defined? Position::NORTH).to be_truthy
  end
  it "has EAST orientation" do
    expect(defined? Position::EAST).to be_truthy
  end
  it "has SOUTH orientation" do
    expect(defined? Position::SOUTH).to be_truthy
  end
  it "has WEST orientation" do
    expect(defined? Position::WEST).to be_truthy
  end

  describe "::new" do
    subject(:position) { Position.new(2, 3, Position::NORTH) }

    it "creates an instance of Position" do
      expect(position).to be_a Position
    end

    it "sets x component" do
      expect(position.x).to eq(2)
    end

    it "sets y component" do
      expect(position.y).to eq(3)
    end

    it "sets orientation" do
      expect(position.orientation).to eq(Position::NORTH)
    end
  end

  describe "#advance" do
    context "when facing North" do
      it "increments y component by 1" do
        position = Position.new(2, 2, Position::NORTH)
        expect(position.advance).to eq(Position.new(2, 3, Position::NORTH))
      end
    end

    context "when facing East" do
      it "increments x component by 1" do
        position = Position.new(2, 2, Position::EAST)
        expect(position.advance).to eq(Position.new(3, 2, Position::EAST))
      end
    end

    context "when facing South" do
      it "decrements y component by 1" do
        position = Position.new(2, 2, Position::SOUTH)
        expect(position.advance).to eq(Position.new(2, 1, Position::SOUTH))
      end
    end

    context "when facing West" do
      it "decrements x component by 1" do
        position = Position.new(2, 2, Position::WEST)
        expect(position.advance).to eq(Position.new(1, 2, Position::WEST))
      end
    end
  end

  describe "#left" do
    context "when facing North" do
      it "faces West" do
        position = Position.new(2, 2, Position::NORTH)
        expect(position.left).to eq(Position.new(2, 2, Position::WEST))
      end
    end

    context "when facing East" do
      it "faces North" do
        position = Position.new(2, 2, Position::EAST)
        expect(position.left).to eq(Position.new(2, 2, Position::NORTH))
      end
    end

    context "when facing South" do
      it "faces East" do
        position = Position.new(2, 2, Position::SOUTH)
        expect(position.left).to eq(Position.new(2, 2, Position::EAST))
      end
    end

    context "when facing West" do
      it "faces South" do
        position = Position.new(2, 2, Position::WEST)
        expect(position.left).to eq(Position.new(2, 2, Position::SOUTH))
      end
    end
  end

  describe "#right" do
    context "when facing North" do
      it "faces West" do
        position = Position.new(2, 2, Position::NORTH)
        expect(position.right).to eq(Position.new(2, 2, Position::EAST))
      end
    end

    context "when facing East" do
      it "faces North" do
        position = Position.new(2, 2, Position::EAST)
        expect(position.right).to eq(Position.new(2, 2, Position::SOUTH))
      end
    end

    context "when facing South" do
      it "faces East" do
        position = Position.new(2, 2, Position::SOUTH)
        expect(position.right).to eq(Position.new(2, 2, Position::WEST))
      end
    end

    context "when facing West" do
      it "faces South" do
        position = Position.new(2, 2, Position::WEST)
        expect(position.right).to eq(Position.new(2, 2, Position::NORTH))
      end
    end
  end
end

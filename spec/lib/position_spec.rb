require 'position'

describe Position do
  describe "Initialization" do
    subject(:position) do
      Position.new(2, 3, Position::NORTH)
    end

    it "- is an instance of Position" do
      expect(position).to be_a Position
    end

    it "- sets x coordinate" do
      expect(position.x).to eq(2)
    end

    it "- sets y coordinate" do
      expect(position.y).to eq(3)
    end

    it "- sets orientation" do
      expect(position.orientation).to eq(Position::NORTH)
    end
  end
end

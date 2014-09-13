require 'grid'

describe Grid do
  describe "::new" do
    subject(:grid) { Grid.new(4, 3) }

    it "creates an instance of Grid" do
      expect(grid).to be_a Grid
    end

    it "sets a size" do
      expect(grid.width).to eq(4)
      expect(grid.height).to eq(3)
    end
  end
end

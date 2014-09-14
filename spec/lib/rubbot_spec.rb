require 'rubbot'

describe Rubbot do
  let(:grid) { Grid.new(5, 5) }

  describe "::new" do
    subject(:rubbot) { Rubbot.new(grid) }

    it "creates an instance of Rubbot" do
      expect(rubbot).to be_a Rubbot
    end
  end
end

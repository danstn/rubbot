require 'rubbot'

describe Rubbot do
  describe "Initialization" do
    subject(:rubbot) do
      Rubbot.new
    end

    it "- is an instance of Rubbot" do
      expect(rubbot).to be_a Rubbot
    end
  end
end

require 'rubbot'

describe Rubbot do
  describe "::new" do
    subject(:rubbot) { Rubbot.new }

    it "creates an instance of Rubbot" do
      expect(rubbot).to be_a Rubbot
    end
  end
end

require 'robot'

describe Robot do
  describe "Initialization" do
    subject(:robot) do
      Robot.new
    end

    it "- is an instance of Robot" do
      expect(robot).to be_a Robot
    end
  end
end

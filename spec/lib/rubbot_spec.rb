require 'spec_helper'

describe Rubbot do
  let(:grid) { Grid.new(5, 5) }

  describe "::new" do
    subject(:rubbot) { Rubbot.new(grid) }

    it "creates an instance of Rubbot" do
      expect(rubbot).to be_a Rubbot
    end
  end

  describe "#start" do
    let(:stdin) { Utils::StdinSimulator.new }
    let(:stdout) { StringIO.new }

    context "invalid command supplied" do
      it "rescue an exception" do
        stdin << "rescue me"
        rubbot = Rubbot.new(grid, stdin: stdin, stdout: stdout)
        expect { rubbot.start }.to_not raise_error
      end
    end
  end
end

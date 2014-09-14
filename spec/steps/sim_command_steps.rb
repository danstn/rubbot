step "rubbot is setup" do
  @stdin  = Utils::StdinSimulator.new
  @stdout = StringIO.new
  #
  @rubbot = Rubbot.new(@grid, stdin: @stdin, stdout: @stdout)
end

step "rubbot is started" do
  @rubbot.start
end

step "the input is :command" do |command|
  @stdin << command
end

step "the output is :output" do |output|
  expect(@stdout.string).to eq(output)
end

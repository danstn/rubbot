require_relative 'rubbot_cli'
require_relative 'robot'

class Rubbot
  def initialize(grid, options = {})
    # Optionally accept redefined standard I/O
    @stdin  = options.fetch(:stdin)  { STDIN }
    @stdout = options.fetch(:stdout) { STDOUT }
    @robot = Robot.new(grid)
  end

  def start
    while input = @stdin.gets
      cmd = Commands::parse(input)
      cmd.execute(@robot, output: @stdout)
    end
  end
end
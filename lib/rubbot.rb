# Trap early interrupts
Signal.trap("INT") do
  puts "Bye-bye!"
  exit 1
end

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
      begin
        cmd = Commands::parse(input)
        cmd.execute(@robot, output: @stdout)
      rescue Commands::NoCommandError, RobotInterface::Place::InvalidFormatError => e
        p "Invalid input. #{e.message}"
      end
    end
  end
end

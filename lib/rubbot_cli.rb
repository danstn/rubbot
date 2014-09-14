module RobotInterface
  class Command < Struct.new(:args)
  end

  class Place < Command
    def initialize(args)
      super
      @x = args.shift.to_i
      @y = args.shift.to_i
      @orientation = Position.const_get(args.shift.upcase)
    end

    def execute(robot, options = {})
      robot.place Position.new(@x, @y, @orientation)
    end
  end

  class Report < Command
    def execute(robot, options = {})
      output = options.fetch(:output)
      output << robot.report
    end
  end
end

module Commands
  # Map input instructions to Robot actions
  COMMANDS_MAP = {
    "PLACE"  => RobotInterface::Place,
    "REPORT" => RobotInterface::Report,
  }

  NoCommandError = Class.new(Exception)

  def self.parse(input)
    cmd, args = input.split
    args = String(args).split(",")
    cmd_class = COMMANDS_MAP[cmd]
    raise NoCommandError.new "'#{cmd}'' is undefined." unless cmd_class
    cmd_class.new args
  end
end

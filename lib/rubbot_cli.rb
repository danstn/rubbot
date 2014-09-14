module RobotInterface
  class Command < Struct.new(:args)
    NoArgumentsError = Class.new(Exception)
  end

  class Place < Command
    FORMAT = /-?\d+,-?\d+,(NORTH|EAST|SOUTH|WEST)\s*$/mi

    InvalidFormatError = Class.new(Exception)

    def initialize(args)
      super
      validate_format args
      @x = args.shift.to_i
      @y = args.shift.to_i
      @orientation = Position.const_get(args.shift.upcase)
    end

    def execute(robot, options = {})
      robot.place Position.new(@x, @y, @orientation)
    end

    private

    def validate_format(argv)
      if args = argv.join(',') and args.match(FORMAT).nil?
        raise InvalidFormatError.new "'PLACE' format is invalid : '#{args}'"
      end
    end
  end

  class Move < Command
    def execute(robot, options = {}) robot.move end
  end

  class Left < Command
    def execute(robot, options = {}) robot.rotate_left end
  end

  class Right < Command
    def execute(robot, options = {}) robot.rotate_right end
  end

  class Report < Command
    def execute(robot, options = {})
      output = options.fetch(:output)
      output << robot.report + "\n"
    end
  end
end

module Commands
  # Map input instructions to Robot actions
  COMMANDS_MAP = {
    "PLACE"  => RobotInterface::Place,
    "MOVE"   => RobotInterface::Move,
    "LEFT"   => RobotInterface::Left,
    "RIGHT"  => RobotInterface::Right,
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

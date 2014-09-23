module Utils
  # Standard input simulator
  class StdinSimulator
    attr_reader :input_queue

    def initialize
      # Represent an input queue as an array
      @input_queue = []
    end

    def <<(input)
      # Add an element to the input queue
      @input_queue << input
    end

    def gets
      # Dequeue the first element in the queue
      @input_queue.shift
    end
  end
end

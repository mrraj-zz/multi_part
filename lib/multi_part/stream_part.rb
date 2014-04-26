module MultiPart
  class StreamPart
    def initialize(stream)
      @stream = stream
    end

    def size
      @stream.size
    end

    def read
      @stream.read
    end
  end
end

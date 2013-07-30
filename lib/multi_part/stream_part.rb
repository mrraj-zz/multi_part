module MultiPart

  class StreamPart
    delegate :size, :read, :to => :@stream

    def initialize(stream)
      @stream = stream
    end
  end
end

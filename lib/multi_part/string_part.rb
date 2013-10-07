module MultiPart

  class StringPart
    def initialize(string)
      @stringio = StringIO.new(string)
    end

    def size
      @stringio.size
    end

    def read
      @stringio.read
    end
  end
end

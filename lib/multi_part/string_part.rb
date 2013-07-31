module MultiPart

  class StringPart
    delegate :size, :read, :to => :@stringio

    def initialize(string)
      @stringio = StringIO.new(string)
    end
  end
end

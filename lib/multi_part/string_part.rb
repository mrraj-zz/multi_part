module MultiPart

  class StringPart
    delegate :size, :read, :to => :@stringio

    def initialize(boundary, field_name, file_name)
      @stringio = StringIO.new(<<-EOF--#{boundary}
        Content-Disposition: form-data; name="#{field_name}"; filename="#{file_name}"
        Content-Type: video/x-msvideo
      EOF
      )
    end
  end
end

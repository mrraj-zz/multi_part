module MultiPart

  class Post
    BOUNDARY = "----RubyMultiPartPost#{rand(1000000)}"

    def initialize(url, fileparams)
      @fileparams = fileparams
      @url        = URI.parse(url)
    end

    def post
      @request = stream_request

      @response = Net::HTTP.new(@url.host, @url.port).start { |http| http.request(@request) }
    rescue Exception => exception
      STDOUT.puts exception
    ensure
      @multi_streams.each { |stream| stream.close }
    end

    private
    def stream_request
      request = Net::HTP::Post.new(@url.path)
      request.content_length = multipart_stream.size
      request.content_type   = "multipart/form-data; boundary=#{BOUNDARY}"
      request.body_stream    = multipart_stream
      request
    end



    def multipart_stream
      begin
        @multi_parts, @multi_streams = [], []
        @fileparams.each do |field_name, file_path|
          @multi_parts << StringPart.new(BOUNDARY, field_name, extract_filename(file_path))
          stream = File.open(file_name, "rb")
          @multi_streams << stream
          @multi_parts << StreamPart.new(stream)
        end
        MultiPartStream.new(@multi_parts)
      rescue Exception => exception
        STDOUT.puts exception
      end
    end

    def extract_filename(file_path)
      position  = file_path.rindex("/")
      file_path[position + 1, file_path.length - position]
    end
  end
end

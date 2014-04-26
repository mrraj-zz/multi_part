require 'spec_helper'

describe MultiPart::StreamPart do
  let(:content) { 'Test content' }
  let(:stream) { StringIO.new(content) }

  describe '#initialize' do
    it 'should create an instance stream variable' do
      stream_part = MultiPart::StreamPart.new stream
      expect(stream_part.instance_variable_get(:@stream)).to eq stream
    end
  end

  describe '#read' do
    let(:stream_part) { MultiPart::StreamPart.new(stream) }

    it 'should read the stream content' do
      expect(stream_part.read).to eq content
    end
  end

  describe '#size' do
    let(:stream_part) { MultiPart::StreamPart.new(stream) }

    it 'should return size of the stream' do
      expect(stream_part.size).to eq content.length
    end
  end
end

require 'spec_helper'

describe MultiPart::StringPart do
  let(:content) { 'Test content' }

  describe '#initialize' do
    let(:string_part) { MultiPart::StringPart.new content }

    it 'should create an instance stream variable' do
      expect(string_part.instance_variable_get(:@stringio)).to be_instance_of StringIO
    end
  end

  describe '#size' do
    let(:string_part) { MultiPart::StringPart.new content }

    it 'should return the size of the string' do
      expect(string_part.size).to eq content.length
    end
  end

  describe '#read' do
    let(:string_part) { MultiPart::StringPart.new content }

    it 'should return the content of string' do
      expect(string_part.read).to eq content
    end
  end
end

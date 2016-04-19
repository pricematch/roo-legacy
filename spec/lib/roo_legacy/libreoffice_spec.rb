require 'spec_helper'

describe RooLegacy::LibreOffice do
  describe '.new' do
    subject {
      RooLegacy::LibreOffice.new('test/files/numbers1.ods')
    }

    it 'creates an instance' do
      expect(subject).to be_a(RooLegacy::LibreOffice)
    end
  end
end

describe RooLegacy::Libreoffice do
  it 'is an alias of LibreOffice' do
    expect(RooLegacy::Libreoffice).to eq(RooLegacy::LibreOffice)
  end
end

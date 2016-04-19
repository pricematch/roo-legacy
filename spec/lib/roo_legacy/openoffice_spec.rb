require 'spec_helper'

describe RooLegacy::OpenOffice do
  describe '.new' do
    subject {
      RooLegacy::OpenOffice.new('test/files/numbers1.ods')
    }

    it 'creates an instance' do
      expect(subject).to be_a(RooLegacy::OpenOffice)
    end
  end

  # OpenOffice is an alias of LibreOffice. See libreoffice_spec.
end

describe RooLegacy::Openoffice do
  it 'is an alias of LibreOffice' do
    expect(RooLegacy::Openoffice).to eq(RooLegacy::OpenOffice)
  end
end

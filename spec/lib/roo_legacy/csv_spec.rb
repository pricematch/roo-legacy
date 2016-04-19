require 'spec_helper'

describe RooLegacy::CSV do
  let(:path) { 'test/files/csvtypes.csv' }
  let(:csv) { RooLegacy::CSV.new(path) }

  describe '.new' do
    it 'creates an instance' do
      expect(csv).to be_a(RooLegacy::CSV)
    end
  end

  describe '#parse' do
    subject {
      csv.parse(options)
    }
    context 'with headers: true' do
      let(:options) { {headers: true} }

      it "doesn't blow up" do
        expect { subject }.to_not raise_error
      end
    end
  end

  describe '#csv_options' do
    context 'when created with the csv_options option' do
      let(:options) {
        {
          col_sep: '\t',
          quote_char: "'"
        }
      }

      it 'returns the csv options' do
        csv = RooLegacy::CSV.new(path, csv_options: options)
        csv.csv_options.should == options
      end
    end

    context 'when created without the csv_options option' do
      it 'returns a hash' do
        csv = RooLegacy::CSV.new(path)
        csv.csv_options.should == {}
      end
    end
  end
end

describe RooLegacy::Csv do
  it 'is an alias of LibreOffice' do
    expect(RooLegacy::Csv).to eq(RooLegacy::CSV)
  end
end

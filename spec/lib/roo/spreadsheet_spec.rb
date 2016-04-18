require 'spec_helper'

describe RooLegacy::Spreadsheet do
  describe '.open' do
    context 'when the file name includes a space' do
      let(:filename) { 'great scott.xls' }

      it 'loads the proper type' do
        expect(RooLegacy::Excel).to receive(:new).with(filename, {})
        RooLegacy::Spreadsheet.open(filename)
      end
    end

    context 'when the file extension is uppercase' do
      let(:filename) { 'file.XLS' }

      it 'loads the proper type' do
        expect(RooLegacy::Excel).to receive(:new).with(filename, {})
        RooLegacy::Spreadsheet.open(filename)
      end
    end

    context 'for a tempfile' do
      let(:tempfile) { Tempfile.new('foo.csv') }
      let(:filename) { tempfile.path }

      it 'loads the proper type' do
        expect(RooLegacy::CSV).to receive(:new).with(filename, file_warning: :ignore).and_call_original
        expect(RooLegacy::Spreadsheet.open(tempfile, extension: 'csv')).to be_a(RooLegacy::CSV)
      end
    end

    context 'for a url' do
      context 'that is csv' do
        let(:filename) { 'http://example.com/file.csv?with=params#and=anchor' }

        it 'treats the url as CSV' do
          expect(RooLegacy::CSV).to receive(:new).with(filename, {})
          RooLegacy::Spreadsheet.open(filename)
        end
      end
    end

    context 'for a csv file' do
      let(:filename) { 'file.csv' }
      let(:options) { {csv_options: {col_sep: '"'}} }

      context 'with csv_options' do
        it 'passes the csv_options through' do
          expect(RooLegacy::CSV).to receive(:new).with(filename, options)
          RooLegacy::Spreadsheet.open(filename, options)
        end
      end
    end

    context "with spaces in the filename" do
      let(:filename) { 'path with spaces.xls'}

      it 'loads the proper type' do
        expect(RooLegacy::Excel).to receive(:new).with(filename, {})
        RooLegacy::Spreadsheet.open(filename)
      end
    end

    context 'with a file extension option' do
      let(:filename) { 'file.xls' }

      context "xls" do
        let(:options) { { extension: "xls" } }

        it 'loads with xls extension options' do
          expect(RooLegacy::Excel).to receive(:new).with(filename, options)
          RooLegacy::Spreadsheet.open(filename, options)
        end
      end

      context ".xls" do
        let(:options) { { extension: ".xls" } }

        it 'loads with .xls extension options' do
          expect(RooLegacy::Excel).to receive(:new).with(filename, options)
          RooLegacy::Spreadsheet.open(filename, options)
        end
      end

    end
  end
end

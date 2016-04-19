require 'spec_helper'

describe RooLegacy::Excelx do
  describe '.new' do
    subject {
      RooLegacy::Excelx.new('test/files/numbers1.xlsx')
    }

    it 'creates an instance' do
      expect(subject).to be_a(RooLegacy::Excelx)
    end

    context 'given a file with missing rels' do
      subject {
        RooLegacy::Excelx.new('test/files/file_item_error.xlsx')
      }

      it 'creates an instance' do
        expect(subject).to be_a(RooLegacy::Excelx)
      end
    end
  end

  describe '#cell' do
    context 'for a link cell' do
      context 'with numeric contents' do
        subject {
          RooLegacy::Excelx.new('test/files/numeric-link.xlsx').cell('A', 1)
        }

        it 'returns a link with the number as a string value' do
          expect(subject).to be_a(Spreadsheet::Link)
          expect(subject).to eq("8675309.0")
        end
      end
    end
  end
end

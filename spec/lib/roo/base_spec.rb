require 'spec_helper'

describe RooLegacy::GenericSpreadsheet do
  it 'is an alias of Base' do
    expect(RooLegacy::GenericSpreadsheet).to eq(RooLegacy::Base)
  end
end

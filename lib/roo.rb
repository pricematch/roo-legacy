module RooLegacy

  VERSION = '1.12.1'

  def self.const_missing(const_name)
    case const_name
    when :Libreoffice
      warn "`RooLegacy::Libreoffice` has been deprecated. Use `RooLegacy::LibreOffice` instead."
      LibreOffice
    when :Openoffice
      warn "`RooLegacy::Openoffice` has been deprecated. Use `RooLegacy::OpenOffice` instead."
      OpenOffice
    when :Csv
      warn "`RooLegacy::Csv` has been deprecated. Use `RooLegacy::CSV` instead."
      CSV
    when :GenericSpreadsheet
      warn "`RooLegacy::GenericSpreadsheet` has been deprecated. Use `RooLegacy::Base` instead."
      Base
    else
      super
    end
  end

  autoload :Spreadsheet,  'roo/spreadsheet'
  autoload :Base,         'roo/base'

  autoload :OpenOffice,   'roo/openoffice'
  autoload :LibreOffice,  'roo/openoffice'
  autoload :Excel,        'roo/excel'
  autoload :Excelx,       'roo/excelx'
  autoload :Excel2003XML, 'roo/excel2003xml'
  autoload :Google,       'roo/google'
  autoload :CSV,          'roo/csv'
end

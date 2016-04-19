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

  autoload :Spreadsheet,  'roo_legacy/spreadsheet'
  autoload :Base,         'roo_legacy/base'

  autoload :OpenOffice,   'roo_legacy/openoffice'
  autoload :LibreOffice,  'roo_legacy/openoffice'
  autoload :Excel,        'roo_legacy/excel'
  autoload :Excelx,       'roo_legacy/excelx'
  autoload :Excel2003XML, 'roo_legacy/excel2003xml'
  autoload :Google,       'roo_legacy/google'
  autoload :CSV,          'roo_legacy/csv'
end

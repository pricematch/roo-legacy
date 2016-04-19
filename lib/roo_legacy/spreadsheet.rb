module RooLegacy
  class Spreadsheet
    class << self
      def open(path, options = {})
        path = path.respond_to?(:path) ? path.path : path

        extension =
          if options[:extension]
            options[:file_warning] = :ignore
            ".#{options.delete(:extension)}".gsub(/[.]+/, ".")
          else
            File.extname((path =~ URI::regexp) ? URI.parse(URI.encode(path)).path : path)
          end

        case extension.downcase
        when '.xls'
          RooLegacy::Excel.new(path, options)
        when '.xlsx'
          RooLegacy::Excelx.new(path, options)
        when '.ods'
          RooLegacy::OpenOffice.new(path, options)
        when '.xml'
          RooLegacy::Excel2003XML.new(path, options)
        when ''
          RooLegacy::Google.new(path, options)
        when '.csv'
          RooLegacy::CSV.new(path, options)
        else
          raise ArgumentError,
            "Can't detect the type of #{path} - please use the :extension option to declare its type."
        end
      end
    end
  end
end

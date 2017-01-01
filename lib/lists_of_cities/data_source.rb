require 'singleton'

module ListsOfCities
  class DataSource
    include Singleton

    def exec_query(xpath_query)
      doc.xpath(xpath_query)
    end

    def doc
      if @doc.blank?
        File.open(src_path) do |src_xml|
          @doc = Nokogiri::XML(src_xml)
        end
      end
      @doc
    end

    private
    def src_path
      @src_path ||= File.expand_path('../../../data/list.xml', __FILE__)
    end
  end
end

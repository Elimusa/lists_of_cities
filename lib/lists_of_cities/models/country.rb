module ListsOfCities
  class Country < AdministrativeDivision


    attrs :code, :name, :parent

    has_many :provinces

    def self.xml_node_name
      "CountryRegion"
    end

    def parent
      @parent ||= ListsOfCities::Root.new(code: '', name: '')
    end

  end
end

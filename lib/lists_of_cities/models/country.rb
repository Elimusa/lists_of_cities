module ListsOfCities
  class Country < AdministrativeDivision

    has_many :provinces

    def self.xml_node_name
      "CountryRegion"
    end

    def parent
      @parent ||= ListsOfCities::Root.new(code: '', name: '')
    end

  end
end

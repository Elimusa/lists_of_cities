module ListsOfCities
  class Province < AdministrativeDivision
    has_many :cities

    def self.xml_node_name
      'State'
    end

  end
end

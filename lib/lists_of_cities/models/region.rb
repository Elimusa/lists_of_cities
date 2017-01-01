module ListsOfCities
  class Region < AdministrativeDivision
    attrs :code, :name, :parent

    def self.xml_node_name
      'Region'
    end
  end
end

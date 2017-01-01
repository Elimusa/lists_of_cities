module ListsOfCities
  class Province < AdministrativeDivision
    attrs :code, :name, :parent

    has_many :cities

    def self.xml_node_name
      'State'
    end

  end
end

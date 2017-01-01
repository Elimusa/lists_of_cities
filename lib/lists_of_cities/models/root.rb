module ListsOfCities
  class Root < AdministrativeDivision
    attrs :code, :name

    has_many :countries

    def initialize(*args)
      super
    end

    def self.xml_node_name
      'Location'
    end

    def xml_node_path
      "Location"
    end
  end
end

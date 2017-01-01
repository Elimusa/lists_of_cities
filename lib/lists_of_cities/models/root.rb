module ListsOfCities
  class Root < AdministrativeDivision

    has_many :countries

    def initialize(*args)
      super
    end

    def parent
      nil
    end

    def xpath
      nil
    end

    def parent_xpath
      nil
    end

    def self.xml_node_name
      'Location'
    end

    def xml_node_path
      "Location"
    end
  end
end

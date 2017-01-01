module ListsOfCities
  class City < AdministrativeDivision
    include ListsOfCities::ActiveRecord

    has_many :regions

    def self.xml_node_name
      "City"
    end
  end
end

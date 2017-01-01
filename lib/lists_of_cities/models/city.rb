module ListsOfCities
  class City < AdministrativeDivision
    include ListsOfCities::ActiveRecord

    attrs :code, :name, :parent

    has_many :regions

    def self.xml_node_name
      "City"
    end
  end
end

module ListsOfCities
  class AdministrativeDivision
    include ListsOfCities::ActiveRecord

    def xml_node_path
      "#{parent.xml_node_path}/#{self.class.xml_node_name}[@Code='#{self.code}']"
    end

    def self.xml_node_path_for_all(parent=nil)
      if parent.blank?
        "#{self.xml_node_name}"
      else
        "#{parent.xml_node_path}/#{self.xml_node_name}"
      end
    end
  end
end

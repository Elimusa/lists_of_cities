module ListsOfCities
  class AdministrativeDivision
    include ListsOfCities::ActiveRecord
    
    attr_accessor :code, :name, :xpath, :parent_xpath

    def initialize(opts={})
      opts.each do |attr_key, value|
        instance_variable_set("@#{attr_key}", value)
      end
    end

    def parent
      if @parent.blank?
        if parent_xpath.present?
          @parent = DataSource.instance.exec_query(parent_xpath).first.to_division
        elsif xpath.present?
          @parent = DataSource.instance.exec_query(xpath).first.parent.to_division
        end
      end
      @parent
    end

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

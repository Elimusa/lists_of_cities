module ListsOfCities
  class Query
    attr_reader :node_path
    def initialize(_node_path, opts = {})
      @node_path = _node_path
      if opts[:name].present?
        @name = Array(opts[:name])
      end

      if opts[:code].present?
        @code = Array(opts[:code])
      end
    end

    def self.full_path_query_all(country_code=nil, province_code=nil, city_code=nil, region_code=nil)
      paths = [Root.xml_node_name]
      if country_code.present?
        if province_code.present?
          if city_code.present?
              paths << "#{City.xml_node_name}[@Code='#{city_code}']"
              paths << "#{Region.xml_node_name}"
          else
            paths << "#{Province.xml_node_name}[@Code='#{province_code}']/#{City.xml_node_name}"
          end
        else
          paths << "#{Country.xml_node_name}[@Code='#{country_code}']/#{Province.xml_node_name}"
        end
      else
        paths << "#{Country.xml_node_name}"
      end
      paths.join("/")
    end

    def self.full_path_query(country_code=nil, province_code=nil, city_code=nil, region_code=nil)
      paths = [Root.xml_node_name]
      if country_code.present?
        paths << "#{Country.xml_node_name}[@Code='#{country_code}']"
        if province_code.present?
          paths << "#{Province.xml_node_name}[@Code='#{province_code}']"
          if city_code.present?
              paths << "#{City.xml_node_name}[@Code='#{city_code}']"
              if region_code.present?
                paths << "#{Region.xml_node_name}[@Code='#{region_code}']"
              end
          end
        end
      else
        raise
      end
      paths.join('/')
    end

    #Return xpath string
    #This may generate xpath like:
    #'Location/CountryRegion[@Code="1" or @Code="USA"][@Name="中国" or @Name="美国"]'
    def to_query
      query_str = node_path
      if @code.present?
        attr_code_query = @code.map{|code_value| "@Code='#{code_value}'"}.join(" or ")
        query_str = query_str + "[#{attr_code_query}]"
      end
      if @name.present?
        attr_name_query = @name.map { |name_value| "@Name='#{name_value}'" }.join(" or ")
        query_str = query_str + "[#{attr_name_query}]"
      end
      query_str
    end
  end
end

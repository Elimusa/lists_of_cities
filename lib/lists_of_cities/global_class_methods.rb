module ListsOfCities
  class GlobalClassMethods
    class << self

      def countries
        ListsOfCities::Root.new.countries.all
      end

      def country(country_code)
        ListsOfCities::Root.new.countries.where(code: country_code.to_s).first
      end

      def query_all(*args)
        path = Query.full_path_query_all(*args)
        DataSource.instance.exec_query(path).map &:to_division
      end

      def find_by(*args)
        path = Query.full_path_query(*args)
        _result = DataSource.instance.exec_query(path).first
        if _result.blank?
          not_found = "Not found region by path #{path}"
          raise ActiveRecord::NotFound, not_found
        end
        _result.to_division
      end

      alias :provinces :query_all
      alias :cities    :query_all
      alias :regions   :query_all
      alias :province  :find_by
      alias :city      :find_by
      alias :region    :find_by

    end
  end
end

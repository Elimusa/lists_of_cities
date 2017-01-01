module ListsOfCities
  module ActiveRecord
    extend ActiveSupport::Concern
    
    class NotFound < StandardError
    end

    module ClassMethods
      def where(that, opts)
        DivisionList.new(DataSource.instance.exec_query(Query.new(self.xml_node_path_for_all(that), opts).to_query)
                  .map(&->(element){element.to_division(that)}))
      end

      def all(that)
         DivisionList.new(DataSource.instance.exec_query(self.xml_node_path_for_all(that))
                   .map(&->(element){element.to_division(that)}))
      end

      def first(that)
        DataSource.instance.exec_query(self.xml_node_path_for_all(that)).first.to_division
      end

      def last(that)
        DataSource.instance.exec_query(self.xml_node_path_for_all(that)).last.to_division
      end
      private

      def has_many(resources)
        define_method resources.to_sym do
          Association.new klass: ("ListsOfCities::#{resources.to_s.singularize.camelize}").constantize,
                          this: self
        end
      end
    end

  end
end

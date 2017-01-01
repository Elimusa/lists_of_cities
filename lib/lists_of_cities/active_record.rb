module ListsOfCities
  module ActiveRecord
    extend ActiveSupport::Concern
    class NotFound < StandardError
    end

    module ClassMethods
      def where(that, opts)
        DataSource.instance.exec_query(Query.new(self.xml_node_path_for_all(that), opts).to_query)
                  .map(&->(element){element.to_division(that)})
      end

      def all(opts = {})
        that = opts[:that]
        DataSource.instance.exec_query(self.xml_node_path_for_all(that))
                  .map(&->(element){element.to_division(that)})
      end
      private

      def has_many(resources)
        define_method resources.to_sym do
          Association.new klass: ("ListsOfCities::#{resources.to_s.singularize.camelize}").constantize,
                          this: self
        end
      end

      def attrs(*args)
        attr_accessor(*args)

        define_method :initialize do |options|
          args.each do |attr|
            instance_variable_set("@#{attr}", options[attr])
          end
        end
      end
    end

  end
end

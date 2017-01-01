module ListsOfCities
  class Association
    attr_reader :klass, :this
    def initialize klass:, this:
      @klass = klass
      @this = this
    end

    def all
      klass.all(this)
    end

    def where(opts)
      klass.where(this, opts)
    end

    def first
      klass.first(this)
    end

    def last
      klass.last(this)
    end
  end
end

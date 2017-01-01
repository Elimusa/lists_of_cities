module ListsOfCities
  class Association
    attr_reader :klass, :this
    def initialize klass:, this:
      @klass = klass
      @this = this
    end

    def all
      klass.all(that: this)
    end

    def where(opts)
      klass.where(this, opts)
    end
  end
end

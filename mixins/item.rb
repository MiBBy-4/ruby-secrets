require 'date'

module SimpleRPG
  class Item
    # In Ruby we have mixins. Mixins are modules that we can include in our class
    # But to work mixins need to realize some methods
    # For example, in mixin Comparable we need to realize '<=>'(spaceship) method
    include Comparable
    attr_reader :name, :value, :found_at

    def initialize(name, value, found_at)
      @name = name
      @value = value
      @found_at = Date.parse found_at
    end

    # Method that we need to realize to work with mixin
    def <=>(other_item)
      self.value <=> other_item.value
    end
  end
end
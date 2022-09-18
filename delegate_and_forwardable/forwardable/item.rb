require 'date'

module SimpleRPG
  class Item
    include Comparable
    attr_reader :name, :value, :found_at

    def initialize(name, value, found_at)
      @name = name
      @value = value
      @found_at = Date.parse found_at
    end

    def <=>(other_item)
      self.value <=> other_item.value
    end
  end
end
require_relative 'item'
require_relative 'errors'

module SimpleRPG
  class Inventory
    # Enumerable adds a lot of methods to work with object
    # For example method each, find, count, filter
    # Work with like an array
    include Enumerable
    
    attr_reader :owner
    attr_accessor :items

    MAX_ITEMS = 5

    def initialize(owner, *items)
      @owner = owner
      @items = []
      put_to_inventory items
    end

    # Method that we need to realize to Enumerable mixin
    def each
      @items.each { |item| yield(item) }
    end

    # Herringbone method to add new items in inventory(items array)
    def <<(new_items)
      new_items = [new_items] unless new_items.is_a?(Array)

      put_to_inventory new_items
    end

    # Method to get item by index from inventory
    def [](index)
      @items[index]
    end

    private

    def put_to_inventory(new_items)
      raise(SimpleRPG::InventoryOverFlow) if @items.length + new_items.length > MAX_ITEMS
      @items += new_items
    end
  end
end

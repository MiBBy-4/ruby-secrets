require 'forwardable'
require_relative 'item'
require_relative 'errors'

module SimpleRPG
  class Inventory
    include Enumerable
    extend Forwardable
    
    attr_reader :owner
    attr_accessor :items

    # The third way to delegate in Ruby
    # With def_delegators method in Forwardable module
    # On items we delegate two methods: [](get by index), each(iterate all items)
    def_delegators :items, :[], :each

    MAX_ITEMS = 5

    def initialize(owner, *items)
      @owner = owner
      @items = []
      put_to_inventory items
    end

    def <<(new_items)
      new_items = [new_items] unless new_items.is_a?(Array)

      put_to_inventory new_items
    end

    private

    def put_to_inventory(new_items)
      raise(SimpleRPG::InventoryOverFlow) if @items.length + new_items.length > MAX_ITEMS
      @items += new_items
    end
  end
end

require_relative 'inventory'

sword = SimpleRPG::Item.new 'Sting', 10_000, '3rd Feb 2022'

ring = SimpleRPG::Item.new 'The One Ring', 100_000_000, '1th Mar 2022'

armor = SimpleRPG::Item.new 'Mithril Armor', 100_000, '14th Apr 2022'

# Now we can compare object, cause in Item class we used Comparable mixin
# p sword > ring
# p armor.between?(sword, ring)

inventory = SimpleRPG::Inventory.new 'Bilbo Baggins', sword, ring, armor


# Now we can iterate our inventory object, cause we used Enumerable mixin
inventory.sort.each do |item|
  p item
end
p '=' * 20
# A lot of methods are accessed to this object to work like with array
p inventory.first
p inventory.include?(ring)

apple = SimpleRPG::Item.new 'Red Apple', 10, '16th Sep 2022'

inventory << apple

p inventory[0]

require_relative 'processor/zipper'
require_relative 'processor/processor'

# Also blocks can use to send some configurates
Zipper.config do |config|
  config.extension = '.txt'
end

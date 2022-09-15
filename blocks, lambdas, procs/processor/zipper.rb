# Module that helps to call method config
# Approach as a devise gem
module Zipper
  class << self
    attr_accessor :extension

    def config
      yield self
    end
  end
end
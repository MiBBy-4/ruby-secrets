module ExternalLib
  module Utils
    # This is the same logic with Monkey patching, but it is more saveful
    # This way called Refinements
    refine String do
        def snakecase
          self.gsub(/([A-Z]+)(A-Z)[a-z]/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').gsub(/\s/, '_').gsub(/__+/, '_').downcase
        end
    end
  end
end

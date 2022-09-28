require_relative 'utils'

module ExternalLib
  class Main
    # There is we activate our refinements
    # If we don't activate all methods that was defined in refine will not work
    # And all methods that defined in refine we can access only on this Class
    using ExternalLib::Utils
    def initialize(str)
      @str = str
    end

    def do_work
      puts 'ExternalLib doing work...'
      # By default String class doesn't have snakecase method
      # So, lets to modify String class
      @str.snakecase
    end
  end
end

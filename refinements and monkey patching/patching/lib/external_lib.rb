require_relative 'string'

module ExternalLib
  class Main
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

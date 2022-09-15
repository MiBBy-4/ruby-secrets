require 'zip'
require 'pathname'
# Method 'times' get block of code which consist of commands
# Only one block we can send
# 3.times { |i| p i }

# Maybe it is bad way to name namespaces like this, cause name of the main folder is not Zipper,
# by the way it's just a practice :)
module Zipper
  module Processor
    class << self
      def open_and_process_zip(path)
        Zip::File.open_buffer(File.open(path) do |zip_file|
          fetch_zip_entries(zip_file) { |zip_entry| process zip_entry }
        end)
      end

      def fetch_zip_entries(zip_file)
        return unless block_given?
        zip_file.each do |zip_entry|
          next unless proper_ext? zip_entry.name

          # Will throw like an argument in block in open_and_process_zip method(zip_entry)
          yield zip_entry
        end
      end

      def process(zip_entry)
        # Just show content
        p zip_entry.get_input_stream.read
      end

      private

      def proper_ext?(filename)
        Zipper.extension == Pathname.new(filename).extname
      end
    end
  end
end

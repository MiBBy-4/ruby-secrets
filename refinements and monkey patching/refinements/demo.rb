require_relative 'lib/external_lib'

worker = ExternalLib::Main.new 'MyTestName'

result = worker.do_work

puts result.inspect

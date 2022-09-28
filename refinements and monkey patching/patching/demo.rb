require_relative 'lib/external_lib'
require_relative 'own_code'

worker = ExternalLib::Main.new 'MyTestName'

result = worker.do_work # => 'my_test_name'

p result

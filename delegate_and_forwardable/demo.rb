require_relative 'endpoint'

endpoint = Endpoint.new('http://example.com', { query: 'str' })

p endpoint.do_get

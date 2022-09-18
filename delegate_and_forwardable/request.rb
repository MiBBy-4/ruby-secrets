module Request
  def get(path, params)
    p "HTTP GET: #{path} with #{params}"
  end

  def post(path, params)
    p "HTTP POST: #{path} with #{params}"
  end

  def patch(path, params)
    p "HTTP PATCH: #{path} with #{params}"
  end
end

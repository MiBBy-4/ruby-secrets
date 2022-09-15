# This module emulates HTTP methods
module Request
  def post(params)
    p "HTTP POST: #{params.inspect}"

    params.merge(id: rand(1000000))
  end

  def patch(id, params)
    p "HTTP PATCH: #{id} => #{params.inspect}"

    params.merge(id: id)
  end

  def delete(id)
    p "HTTP DELETE: #{id}"

    {
      id: id,
      deleted: true
    }
  end
end
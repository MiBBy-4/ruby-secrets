# For example we got an answer from server
# On first position we got a status
# On the second one array of data
users = [:ok,
  [
    {
      name: 'Ivan',
      surname: 'Ivanov',
      extra: {
        age: '20',
        hobby: 'computer games'
      }
    },
    {
      name: 'John',
      surname: 'Doe',
      extra: {
        age: '18',
        hobby: 'do sport'
      }
    }
  ]
]

# We can also use one-line pattern mathicng like a expression
# This expression will return true
# But it is also experimental in Ruby 3.0
p users[1].any? { |user| user in { name: /van/, extra: {age: '20'} } }

# users = [:error, 'No data!']

case users
in [:ok, data]
  p data
in [:error, error]
  p "Error: #{error}"
else
  p 'Unknown data'
end

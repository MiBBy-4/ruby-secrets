# There are we have a User class, where we can update, delete and create a User
class User < BaseModel
  attr_accessor :id, :name, :surname

  # Method says that User class object supports destroy method
  supports :destroy
end
# And there we have BlogPost class, that will respond on create, delete and update BlogPosts of Users
class BlogPost < BaseModel
  attr_accessor :id, :title, :body

  supports :update, :destroy
end
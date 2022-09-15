require_relative 'main'

post = BlogPost.create(title: 'My post', body: 'Sample')

user = User.create(name: 'John', surname: 'Doe')

p user.inspect

p post.inspect


updated_post = post.update(title: 'Updated title', body: 'new body')

p updated_post.inspect
p user.destroy

# updated_post = BlogPost.update(id: post.id, title: 'Updated title', body: 'new body')

# result = User.destroy(id: user.id)

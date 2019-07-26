@user = User.create(email: "test@test.com", password: 'asdfasdf', password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")  

puts "1 user created"

100.times do | post |
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 posts have been created"

@post = Post.create(date: Date.today, rationale: "A post with comments", user_id: @user.id)

puts "another post has been created" 

10.times do | comment |
  Comment.create!(date: Date.today, content: "#{comment} text content", post_id: @post.id)
end

puts "10 comments have been added to last post"


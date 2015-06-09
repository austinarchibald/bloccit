if Post.where({title: "This title is unique."}).count == 0
  Post.create!(
    title: "This title is unique.",
    body:  "This body is unique too."
    )
end

if Comment.where({body: "This comment is unique."}).count == 0
  Comment.create!(
    post: posts.sample,
    body: "This comment is unique."
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments create"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TagsByPotin.destroy_all
Like.destroy_all
Gossip.destroy_all
Comment.destroy_all
User.destroy_all
PrivateMessage.destroy_all
Conversation.destroy_all
City.destroy_all
Tag.destroy_all

#Create City

5.times do
  city = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
end
puts "Cities created"

#Create Tags
5.times do
  tag = Tag.create!(title: Faker::Dessert.variety)
end
puts "Tags created"

#Create User
10.times do |i|
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , description: Faker::HowIMetYourMother.quote, email: "#{Faker::Internet.email}#{i}", age: Faker::Number.between(18, 75), city_id: City.all.ids.sample, password: "motdepasse")
end
puts "Users created"

#Create Gossip
#checke u moins un tag par gossip
10.times do |i|
  gossip = Gossip.create!(title: "#{Faker::HarryPotter.book} #{i}", content: Faker::HarryPotter.quote, user_id: User.all.ids.sample)
end
puts "Gossips created"

#Create tags by potin
30.times do
  tags_by_potin = TagsByPotin.create!(gossip_id: Gossip.all.ids.sample, tag_id: Tag.all.ids.sample)
end
puts "Join table created"
i = 0
User.all.each do |user|
  i += 1
  puts i
  3.times do
    conversation = Conversation.new(participant1_id: user.id, participant2_id:User.all.reject{|u| user == u}.sample.id)
    while conversation.already_exist?
      conversation = Conversation.new(participant1_id: user.id, participant2_id:User.all.reject{|u| user == u}.sample.id)
    end
    conversation.save!
    10.times do
      privatemessage = PrivateMessage.create!(content: Faker::ChuckNorris.fact, sender_id: conversation.participants[rand(0..1)].id,conversation_id: conversation.id)
    end
  end
end
puts "Conversation and private message created"

#create comments
i = 0
50.times do
  # comment = Comment.create!(content: Faker::Simpsons.quote , user_id: User.all.ids.sample, gossip_id: Gossip.all.ids.sample)
  comment = Comment.create!(content: Faker::Simpsons.quote, user_id: User.all.ids.sample, commentable_type: Gossip.name, commentable_id: Gossip.all.ids.sample)
end

50.times do
  # comment = Comment.create!(content: Faker::Simpsons.quote , user_id: User.all.ids.sample, gossip_id: Gossip.all.ids.sample)
  comment = Comment.create!(content: Faker::Simpsons.quote, user_id: User.all.ids.sample,commentable_type: Comment.name, commentable_id: Comment.all.ids.sample)
end
puts "Comments created"

#create likes
#de façon aléatoire va rajouter 1 like à 1 comment ou à 1 like
i = 0
100.times do
  if i % rand(2..3) == 0
    like = Like.create!(comment_id: Comment.all.ids.sample, user_id: User.all.ids.sample)
  else
    like = Like.create!(gossip_id: Gossip.all.ids.sample, user_id: User.all.ids.sample) #comment_id: Comment.ids.first(2).sample) 
  end
  i += 1
end
i = 0
puts "Likes created"


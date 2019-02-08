# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MultiPm.destroy_all
TagsByPotin.destroy_all
Like.destroy_all
Gossip.destroy_all
Comment.destroy_all
User.destroy_all
PrivateMessage.destroy_all
City.destroy_all
Tag.destroy_all

#Create City
5.times do
  city = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
end

#Create Tags
5.times do
  tag = Tag.create!(title: Faker::Dessert.variety)
end

#Create User
10.times do |i|
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , description: Faker::HowIMetYourMother.quote, email: "#{Faker::Internet.email}#{i}", age: Faker::Number.between(18, 75), city_id: City.all.ids.sample, password: "motdepasse")
end

#Create Gossip
#checke u moins un tag par gossip
10.times do |i|
  gossip = Gossip.create!(title: "#{Faker::HarryPotter.book} #{i}", content: Faker::HarryPotter.quote, user_id: User.all.ids.sample)
end

#Create tags by potin
30.times do
  tags_by_potin = TagsByPotin.create!(gossip_id: Gossip.all.ids.sample, tag_id: Tag.all.ids.sample)
end

#Create Private Message
10.times do
  privatemessage = PrivateMessage.create!(content: Faker::ChuckNorris.fact, sender_id: User.all.ids.sample)
end

#create join table
10.times do
  multi_pm = MultiPm.create!(user_id: User.all.ids.sample, private_message_id: PrivateMessage.all.ids.sample)
end

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
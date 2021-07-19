require 'faker'
require 'date'

puts 'clearing database'


Church.destroy_all
Event.destroy_all
puts 'Creating Churches'
cities = ['Omotesando', 'Akihabara', 'Fujisawa', 'Saitama', 'Setagaya', 'Ueno', 'Meguro', 'Shibuya', 'Shinagawa', 'Kanda', 'Shinjuku', 'Mitaka']


10.times do
  example = User.create!(
    name:  Faker::Name.first_name + " " + Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
end

# puts "Created #{User.count} Users"

20.times do
    city = cities.sample
    club = Church::CHURCHNAMES.sample
    Church.create!(
    address1: (101...499).to_a.sample,
    city: "#{city}",
    prefecture: "Tokyo",
    location: ("#{city}, Tokyo"),
    post_code: (((100..200).to_a.sample.to_s + "-" + (4000..6000).to_a.sample.to_s)),
    name:   ("#{city} Christian #{club}"),
    pastor: Faker::Name.first_name + " " + Faker::Name.last_name,
    website: "www.#{city.downcase}#{club.downcase}.com",
    user_id: (User.all.sample).id
  )
end

puts "Created #{Church.count} Churches"

20.times do
    church = Church.all.sample
    user = User.all.sample
    Event.create!(
    church_id: church.id,
    user_id: user.id,
    location: church.location,
    start: DateTime.now + ((7..31).to_a.sample),
    name:   "Church Gathering"
  )
end

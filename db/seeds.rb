require 'faker'
require 'date'

puts 'clearing database'
# Booking.destroy_all
# Workout.destroy_all
Church.destroy_all
puts 'Creating Churches'
cities = ['Omotesando', 'Akihabara', 'Fujisawa', 'Saitama', 'Setagaya', 'Ueno', 'Meguro', 'Shibuya', 'Shinagawa', 'Kanda', 'Shinjuku', 'Mitaka']


# 10.times do
#   example = User.create!(
#     name:  Faker::Name.first_name + " " + Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#   )
# end

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
    website: "www.#{city.downcase}#{club.downcase}.com"
  )
end

puts "Created #{Church.count} Churches"

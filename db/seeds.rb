require 'faker'
require 'date'

puts 'clearing database'
# Booking.destroy_all
# Workout.destroy_all
# User.destroy_all
puts 'Creating Users & Workouts'
locations = ['Omotesando', 'Akihabara', 'Fujisawa', 'Saitama', 'Setagaya', 'Ueno', 'Meguro', 'Shibuya', 'Shinagawa', 'Kanda', 'Shinjuku', 'Mitaka']


# 10.times do
#   example = User.create!(
#     name:  Faker::Name.first_name + " " + Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#   )
# end

puts "Created #{User.count} Users"

10.times do
    location = locations.sample
    club = Church::CHURCHNAMES.sample
    Church.create!(
    location: ("#{location}, Tokyo"),
    name:   ("#{location} Christian #{club}"),
  )
end

puts "Created #{Church.count} Churches"

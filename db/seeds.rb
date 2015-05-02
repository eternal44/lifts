# User.create!(name:  "James Youn",
#              email: "jamesyoun710@gmail.com",
#              password:              "gooneen44",
#              password_confirmation: "gooneen44",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)



# Lift.create!(lift_name: "Squat")
# Lift.create!(lift_name: "Clean")

Gym.create!(gym_name: "LA Boulders",
            street: "1375 E 6th St #8",
            city: "Los Angeles",
            state: "CA",
            zip: 90021)

Gym.create!(gym_name: "24 Hour Fitness",
            street: "500 N Atlantic Blvd",
            city: "Monterey Park",
            state: "CA",
            zip: 91754)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end

# users = User.order(:created_at).take(6)
# 40.times do
#   lift_id = Faker::Number.between(from=1, to=2)
#   lift_weight = Faker::Number.between(from=100, to=700)
#   users.each { |user| user.records.create!(lift_weight: lift_weight, lift_id: lift_id) }
# end

# # Following relationships
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Trip.destroy_all
Rider.destroy_all

users = FactoryBot.create_list(:user, 5)
trip1 = FactoryBot.create(:trip, start_date: '2025-11-02', end_date: '2025-12-12')
trip2 = FactoryBot.create(:trip, start_date: '2020-11-02', end_date: '2020-12-12')
FactoryBot.create(:rider, user_id: User.first.id, trip_id: trip1.id)
FactoryBot.create(:rider, user_id: User.last.id, trip_id: trip1.id)
FactoryBot.create(:rider, user_id: User.first.id, trip_id: trip2.id)
FactoryBot.create(:friendship, user_id: users[0].id, friend_id: users[1].id)
FactoryBot.create(:friendship, user_id: users[1].id, friend_id: users[0].id)
FactoryBot.create(:friendship, user_id: users[2].id, friend_id: users[3].id)
FactoryBot.create(:resort_option, trip_id: trip1.id)
FactoryBot.create(:resort_option, trip_id: trip1.id)
FactoryBot.create(:resort_option, trip_id: trip2.id)

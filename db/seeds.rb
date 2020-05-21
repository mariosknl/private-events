# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_names = ["Marios","Kubilay","Luke", "Jimi", "Adrian", "Starbucks", "Coffee",
  "Arbat", "Arbat", "Patras"]

user_names.each do |name|
  User.create(name: name)
end

events = ["Metallica Concert","Classical Music Concert",
  "Jazz Sessions","DJ Set","Ballet Show","Circus", "Cinema",
  "Going to Mordor", "Friends Meeting", "Beer Contest", "Hackaton", "Going to Mars"]

date = ["2020-02-06","2021-02-02"]

6.times do |index|
  User.first.events.create(description: events[index], location: "Greece/Patras", date: date.sample)
  User.find(2).events.create(description: events[11-index], location: "Turkey/Ankara", date: date.sample)
end

User.all.ids.each do |user_id|
  Event.all.ids.each do |event_id|
    Invitation.create(attendee_id: user_id, attended_event_id: event_id)
  end
end

user_names = ["Ankara", "Athens", "Skywalker", "Starwars", "Frodo",
  "Gandalf", "The Ring", "Smeagol"]

user_names.each do |name|
  User.create(name: name)
end

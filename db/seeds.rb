# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_names = ["Forger","Frodo", "Gandalf", "Legolas", "Boromir", "Sauron",
  "Pippin", "Bilbo", "Saruman","Galadriel", "Madril", "Elanor", "Uruk", "Merry",
    "Gimli", "Gollum", "King", "Smeagol", "Isildur"]

user_names.each do |name|
  User.create(name: name)
end

team_1 = ["Forger", "Frodo", "Gandalf", "Legolas", "Boromir",
  "Pippin", "Bilbo", "Galadriel", "Elanor", "Merry",
    "Gimli", "King", "Isildur"]
team_2 = ["Sauron", "Saruman", "Madril", "Uruk", "Gollum", "Smeagol"]

events = [
  ["Forger","Forging One Ring","Mountains","1600-02-06 10:00"],
  ["Sauron","War of the Elves and Sauron","Mountains","1693-01-12 22:00"],
  ["Isildur","War of Sauron and Isildur","Middle Earth","1741-12-10 18:00"],
  ["Isildur","Ring Celebration Party","Castle","1741-12-11 19:00"],
  ["Gollum","Finding the Ring Celebration","My Cave","1801-02-05 15:00"],
  ["Bilbo","Finding the Ring Celebration","Hobitton","1941-10-10 10:10"],
  ["Gollum","Search For The Ring","Mountains","1950-06-12"],
  ["Bilbo", "Bilbo's Party", "Hobbiton", "2001-09-22 12:00" ],
  ["Frodo","Taking The Ring Back To The Mordor","Mordor","2021-02-02 02:02"],
  ["Legolas","Arrow Party","Garden","2021-03-01 03:01"],
  ["Gandalf","Looking At The Dawn","Mountains","2021-03-02 05:30"],
  ["Boromir","War Field","Undying Lands","2023-05-05 12:30"],
  ["Sauron","Killing Frodo and Friends","Mordor","2021-03-02 05:30"]
]

events.each do |event|
  User.find_by(name: event[0]).events.create(description: event[1], location: event[2], date: event[3])
end

Event.all.each do |event|
  event_id = event.id
  creator = event.creator.name
  team = team_1.include?(creator) ? team_1 : team_2
  team.each do |member|
    user_id = User.find_by(name: member).id
    Invitation.create(attendee_id: user_id, attended_event_id: event_id)
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Marios","Kubilay","Luke", "Jimi", "Adrian", "Starbucks", "Coffee", "Arbat"].each do |name|
  User.create(name: name)
end

events = ["Metallica Concert","Classical Music Concert","Jazz Sessions","DJ Set","Ballet Show","Circus"]

date = ["2020-02-06","2021-02-02"]

3.times do |index| 
  User.first.events.create(description: events[index], location: "Greece/Patras", date: date.sample)
  User.find(2).events.create(description: events[5-index], location: "Turkey/Ankara", date: date.sample)
end
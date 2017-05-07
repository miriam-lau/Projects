b1 = Band.create(name: 'Mozart')


a1 = Album.create(name: 'Req1', band_id: b1.id)
a2 = Album.create(name: 'Magic Flute', band_id: b1.id)# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

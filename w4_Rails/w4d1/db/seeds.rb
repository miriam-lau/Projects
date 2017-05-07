# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({name: 'Pablo', email: 'cubes@picasso.com', username: 'pablo1'})
user2 = User.create({name: 'Edgar', email: 'ballerinas@degas.com', username: 'edgy'})
user3 = User.create({name: 'Pablo Picassi', email: 'circles@picassi.com', username: 'pablo_real'})
user4 = User.create({name: 'Pollock', email: 'splat@jackson.com', username: 'jp'})

art1 = Artwork.create({image_url: 'http://lewebpedagogique.com/histoiredesartscamus/files/2014/10/guernica.jpg',
      title: 'Guernica', artist_id: 1})
art2 = Artwork.create({image_url: 'https://upload.wikimedia.org/wikipedia/en/b/bc/Old_guitarist_chicago.jpg',
      title: 'The Old Guitarist', artist_id: 1})
art3 = Artwork.create({image_url: 'https://s-media-cache-ak0.pinimg.com/originals/65/43/18/6543185d00d360a68f6ec8f27760e3ae.jpg',
      title: 'Blue Dancers', artist_id: 2})
art4 = Artwork.create({image_url: 'http://www.jackson-pollock.org/images/paintings/autumn-rhythm.jpg',
      title: 'Autumn Rhythm', artist_id: 4})


shares1 = ArtworkShare.create({artwork_id: 1, viewer_id: 3})
shares2 = ArtworkShare.create({artwork_id: 1, viewer_id: 2})
shares3 = ArtworkShare.create({artwork_id: 2, viewer_id: 4})
shares4 = ArtworkShare.create({artwork_id: 3, viewer_id: 1})
shares5 = ArtworkShare.create({artwork_id: 4, viewer_id: 4})

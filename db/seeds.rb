require 'open-uri'
require 'json'
Message.destroy_all
Tindog.destroy_all
User.destroy_all
Walk.destroy_all
Match.destroy_all

p "------------------------"
p "-------DOG IMAGES-------"

file1 = URI.open("https://img.freepik.com/free-photo/cute-sweet-puppy-australian-shepherd-pet-posing-isolated-white-wall_155003-36677.jpg?w=996&t=st=1693843042~exp=1693843642~hmac=b53178c2e84b47060efaeffb9a3389c35a4ae985fdd6b62ff3fe1d8ca6ca4615")
puts "img1"
file2 = URI.open("https://images.pexels.com/photos/2409503/pexels-photo-2409503.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
puts "img2"
file3 = URI.open("https://www.chien.fr/assets/img/000/107/og-image/teckel.jpg")
puts "img3"
file4 = URI.open("https://www.eleveurs-online.com/data/eleveur/140/1600-139061.253.jpg")
puts "img4"
file5 = URI.open("https://animalaxy.fr/wp-content/uploads/2018/02/iStock-1197663442-758x505.jpg")
puts "img5"
file6 = URI.open("https://global-uploads.webflow.com/62b2d13ccd148d1bccca591c/64b589b868c9cf057cbaec8f_Taille%20Dalmatien.jpg")
puts "img6"
file7 = URI.open("https://www.santevet.com/upload/admin/images/article/Chien%202/races_de_chiens/siberian-husky.jpg")
puts "img7"
file8 = URI.open("https://www.empruntemontoutou.com/wp-content/uploads/2020/02/LEONBERG.jpg")
puts "img8"

p "------------------------"
p "----------USERS---------"

user1 = User.new(username: "Toto", email: "test@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user1.save ? "user1 OK" : "Problem with user1"
user2 = User.new(username: "Tata", email: "test1@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user2.save ? "user2 OK" : "Problem with user2"
user3 = User.new(username: "Titi", email: "test2@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user3.save ? "user3 OK" : "Problem with user3"
user4 = User.new(username: "Tutu", email: "test3@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user4.save ? "user4 OK" : "Problem with user4"
user5 = User.new(username: "Popo", email: "test4@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user5.save ? "user5 OK" : "Problem with user5"
user6 = User.new(username: "Koko", email: "test5@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user6.save ? "user6 OK" : "Problem with user6"
user7 = User.new(username: "Momo", email: "test6@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user7.save ? "user7 OK" : "Problem with user7"
user8 = User.new(username: "Coco", email: "test7@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
p user8.save ? "user8 OK" : "Problem with user8"


p "------------------------"
p "----------DOGS----------"

dog1 = Dog.new(
  name: "Rex", breed: "Berger Australien", age: 4, size: "Grand", sexe: "Mâle",
  energy: rand(1..3), neutered: true, user_id: user1.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog1.photo.attach(io: file1, filename: "toto.jpg", content_type: "image/jpg")
p dog1.save ? "dog1 OK" : "Problem with dog1"

dog2 = Dog.new(
  name: "Ostia", breed: "Golden retriever", age: 7, size: "Grand", sexe: "Femelle",
  energy: rand(1..3), neutered: true, user_id: user2.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog2.photo.attach(io: file2, filename: "titi.jpg", content_type: "image/jpg")
p dog2.save ? "dog2 OK" : "Problem with dog2"

dog3 = Dog.new(
  name: "Buddy", breed: "Teckel", age: 2, size: "Petit", sexe: "Femelle",
  energy: rand(1..3), neutered: true, user_id: user3.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog3.photo.attach(io: file3, filename: "tata.jpg", content_type: "image/jpg")
p dog3.save ? "dog3 OK" : "Problem with dog3"

dog4 = Dog.new(
  name: "Ren", breed: "Berger Australien", age: 3, size: "Moyen", sexe: "Mâle",
  energy: rand(1..3), neutered: true,  user_id: user4.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog4.photo.attach(io: file4, filename: "tete.jpg", content_type: "image/jpg")
p dog4.save ? "dog4 OK" : "Problem with dog4"

dog5 = Dog.new(
  name: "Zak", breed: "Berger des Shetland", age: 5, size: "Grand", sexe: "Mâle",
  energy: rand(1..3), neutered: false, user_id: user5.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog5.photo.attach(io: file5, filename: "tyty.jpg", content_type: "image/jpg")
p dog5.save ? "dog5 OK" : "Problem with dog5"

dog6 = Dog.new(
  name: "Indra", breed: "Dalmatien", age: 1, size: "Grand", sexe: "Femelle",
  energy: rand(1..3), neutered: false, user_id: user6.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog6.photo.attach(io: file6, filename: "tootoo.jpg", content_type: "image/jpg")
p dog6.save ? "dog6 OK" : "Problem with dog6"

dog7 = Dog.new(
  name: "Yuna", breed: "Husky", age: 7, size: "Moyen", sexe: "Femelle",
  energy: rand(1..3), neutered: false, user_id: user7.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog7.photo.attach(io: file7, filename: "teetee.jpg", content_type: "image/jpg")
p dog7.save ? "dog7 OK" : "Problem with dog7"

dog8 = Dog.new(
  name: "Pirouette", breed: "Leonberg", age: 1, size: "Moyen", sexe: "Femelle",
  energy: rand(1..3), neutered: false, user_id: user8.id, neutered_males: true, neutered_females: true,
  unneutered_females: true, unneutered_males: true, small_dogs: true, big_dogs: true
)
dog8.photo.attach(io: file8, filename: "taataa.jpg", content_type: "image/jpg")
p dog8.save ? "dog8 OK" : "Problem with dog8"

p "------------------------"
p "----------WALKS---------"

url = "https://data.grandlyon.com/geoserver/metropole-de-lyon/ows?SERVICE=WFS&VERSION=2.0.0&request=GetFeature&typename=metropole-de-lyon:evg_esp_veg.envpdiprboucle&outputFormat=application/json&SRSNAME=EPSG:4171&startIndex=0&sortBy=gid&count=100"
file = URI.open(url)
walks = JSON.parse(file.read)

p "Lyon region"
walks['features'].each do |walk|
  Walk.create(
    city: walk['properties']['commune_depart'],
    title: walk['properties']['nom'],
    distance: walk['properties']['longueur'],
    difficulty: walk['properties']['difficulte'],
    duration: walk['properties']['temps_parcours'].to_i,
    description: walk['properties']['descriptif'],
    start_address_longitude: walk['properties']['xdepart'],
    start_address_latitude: walk['properties']['ydepart'],
    geometry: walk['geometry'],
  )
end

puts "BUG FIX for Lyon region walks"
bug_one = Walk.where(title: "Jeu de Regards sur Méginand")
Walk.destroy(bug_one.ids)
bug_two = Walk.where(title: "Petit sentier du Bois du Fort")
Walk.destroy(bug_two.ids)
bug_three = Walk.where(title: "Champ Blanc")
Walk.destroy(bug_three.ids)
puts "BUG FIX: done"

p "Lyon"
geojsons_file_names = Dir.children("db/geojson")
geojsons_file_names.each do |geojson_file_name|
  file = File.read("db/geojson/#{geojson_file_name}")
  json = JSON.parse(file)
  Walk.create(
    city: json['features'].last['properties']['city'],
    title: json['features'].last['properties']['title'],
    distance: json['features'].last['properties']['distance'],
    difficulty: json['features'].last['properties']['difficulty'],
    duration: json['features'].last['properties']['duration'].to_i,
    description: json['features'].last['properties']['description'],
    start_address_longitude: json['features'].last['properties']['start_address_longitude'],
    start_address_latitude: json['features'].last['properties']['start_address_latitude'],
    geometry: json['features'].last['geometry']
  )
end

p "------------------------"

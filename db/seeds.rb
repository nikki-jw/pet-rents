# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

australia = [
    {state: "New South Wales", city: ["Sydney", "Newcastle", "Wollongong"]},
    {state: "South Australia", city: ["Adelaide"]},
    {state: "Queensland", city: ["Brisbane", "Gold Coast", "Cairns"]},
    {state: "Western Australia", city: ["Perth"]},
    {state: "Victoria", city: ["Melbourne", "Bendigo", "Ballarat"]},
    {state: "Tasmania", city: ["Hobart"]},
    {state: "Australian Capital Territory", city: ["Canberra"]},
    {state: "Northern Territory", city: ["Darwin"]}
    ]

    
animals = [
            "Dog",
            "Cat",
            "Rabbit",
            "Other"
        ]

attributes = [
                "Cats", 
                "Dogs", 
                "Small animals", 
                "Children", 
                "Car rides", 
                "Walks", 
                "Baths", 
                "Snacks", 
                "Swimming", 
                "Sleeping", 
                "Being brushed", 
                "Vaccum cleaner", 
                "Indoors", 
                "Outdoors",
                "Toys",
                "Pats"
            ]

user = User.create(:email => 'admin@gmail.com', :password => 'password', :password_confirmation => 'password')


for i in australia
    state = State.create(state: i[:state])

    for city in i[:city]
       City.create(city: city, state: state)
    end
    
end

for i in animals
    nice = Species.create(species: i)
    p nice
end

for i in attributes
    Like.create(like: i)
    Dislike.create(dislike: i)
end
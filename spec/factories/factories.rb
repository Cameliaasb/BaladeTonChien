FactoryBot.define do
  factory :user do
    username { 'foo' }
    email { 'foo@example.com' }
    password { 'azerty' }
  end

  factory :walk do
    start_address_longitude { 1.0 }
    start_address_latitude { 1.0 }
    end_address_longitude { 1.0 }
    end_address_latitude { 1.0 }
    city { "Lyon" }
    distance { 1 }
    title { "Walk test" }
    difficulty { "Facile" }
    duration { 2 }
    description { "Walk test" }
  end

  factory :dog do
    name { "Test dog" }
    breed { "Test breed" }
    age { 4 }
    size { "Grand" }
    sexe { "Mâle" }
    energy { rand(1..3) }
    neutered { true }
  end
end

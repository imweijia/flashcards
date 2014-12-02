require 'faker'

if Card.all.count == 0
  deck = Deck.create(name: "Geography", instruction: "Guess if place name is a country, a state or a city?")
  50.times do
    randnum = rand(3)
    case randnum
    when 0
      Card.create(question: Faker::Address.country, answer: "country", deck: deck)
    when 1
      Card.create(question: Faker::Address.state, answer: "state", deck: deck)
    when 2
      Card.create(question: Faker::Address.city, answer: "city", deck: deck)
    end
  end
end


if User.all.count == 0
  20.times do
    User.create(username: Faker::Internet.user_name, password: SecureRandom.hex(4))
  end
end


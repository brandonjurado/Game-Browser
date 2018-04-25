FactoryBot.define do

  factory :game, class: Game do
    name "1942"
    description "Capcom's first hit game"
    year 1984
    manufacturer "Capcom"
    active true
  end

  factory :asteroids, class: Game do
    name "Asteroids"
    description "Atari's most successful coin-operated game."
    year 1979
    manufacturer "Atari"
    active true
  end

end

FactoryBot.define do

  factory :like, class: Like do
    game_title "Asteroids"
    liked_at Time.now
    ip_address "127.0.0.1"
    game_id 55
    association :game, factory: :asteroids
  end

end

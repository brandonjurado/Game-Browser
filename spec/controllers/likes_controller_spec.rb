require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  it "like a game" do
    like = create(:like)
    expect(like.game.likes.count).to eq(1)
  end

  it "like same game twice in less than 5 minutes" do
    game = FactoryBot.create(:asteroids)
    like1 = FactoryBot.create(:like)
    like2 = FactoryBot.create(:like)
    # Game is liked
    game.likes << like1
    # 2nd like attempt is made
    game.likes << like2 unless like1.liked_at > 5.minutes.ago
    expect(game.likes.count).to eq(1)
  end

  it "like same game twice after 5 minutes" do
    game = FactoryBot.create(:asteroids)
    like1 = FactoryBot.create(:like)
    like1.liked_at = 5.minutes.ago
    like2 = FactoryBot.create(:like)
    # Game is liked
    game.likes << like1
    # 2nd like attempt is made 5 minutes later
    game.likes << like2 unless like1.liked_at > 5.minutes.ago
    expect(game.likes.count).to eq(2)
  end

end

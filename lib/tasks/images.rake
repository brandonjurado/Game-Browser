require 'csv'

namespace :images do
  task :import => :environment do
    Game.delete_all
    games = CSV.read("#{Rails.root}/../data/games.csv", {headers: true})

    games.each do |game_csv|
      g = Game.new
      g.active = game_csv["is_active"]
      g.description = game_csv["notes"]
      g.manufacturer = game_csv["manufacturer"]
      g.year = game_csv["year"]
      g.name = game_csv["name"]

      logo_path = "#{Rails.root}/../data/game_images/#{g.name}.jpg"

      if File.exists? logo_path
        File.open(logo_path) do |f|
          puts f.path
          g.image = f # just assign the logo attribute to a file
        end
      end

      g.save!
    end
  end
end

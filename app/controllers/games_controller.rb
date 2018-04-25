class GamesController < ApplicationController

  # returns json for the index page at /games
  def index
    games = Game.all.map do |x|
      {
        id: x.id,
        name: x.name,
        year: x.year,
        publisher: x.manufacturer,
        active: x.active,
        url: request.url + x.image.url,
        description: x.description,
        likes: x.likes.count
      }
    end

    render json: games
  end

  # return json for the details of the game at /games/:id
  def show
    @game = Game.find(params[:id])
    render json: @game.as_json(:methods => [:image_url])
  end


end

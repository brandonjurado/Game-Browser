class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: "add_like"
  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  def add_like
    @game = Game.find(params[:liked][:game_id])
    @client_ip = request.remote_ip
    @timestamp = params[:liked][:timestamp]
    @most_recent = Like.where(:game_id => @game.id, :ip_address => @client_ip).last
    if (!@most_recent.nil? && @most_recent.liked_at > 5.minutes.ago)
      return
    end

    @like = Like.new
    @like.game_title = @game.name
    @like.liked_at = @timestamp
    @like.ip_address = @client_ip
    @like.game_id = @game.id

    respond_to do |format|
      if @like.save
        @count = Like.where(:game_title => @game.name).count
        format.json { render json: @like, status: :created }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.fetch(:like, {})
    end
end

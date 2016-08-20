class TweetsController < ApplicationController
  before_action :set_create_tweet, only: [:show, :edit, :update, :destroy]

  # GET /create_tweets
  # GET /create_tweets.json
  def index
    @create_tweets = CreateTweet.all
  end

  def upload
    @triumph_tweets = $client.user_timeline 
    @triumph_tweets.first(5).each_with_index do |tweet, index|
      index_plus_one = index + 1
      this_tweet = Tweet.where(id: index_plus_one).first_or_initialize
      this_tweet.update(text: tweet.text)
      this_tweet.save
    end 
    render nothing: true, status: :ok, content_type: "text/html"
  end

  # GET /create_tweets/1
  # GET /create_tweets/1.json
  def show
  end

  # GET /create_tweets/new
  def new
    @create_tweet = CreateTweet.new
  end

  # GET /create_tweets/1/edit
  def edit
  end

  # POST /create_tweets
  # POST /create_tweets.json
  def create
    @create_tweet = CreateTweet.new(create_tweet_params)

    respond_to do |format|
      if @create_tweet.save
        format.html { redirect_to @create_tweet, notice: 'Create tweet was successfully created.' }
        format.json { render :show, status: :created, location: @create_tweet }
      else
        format.html { render :new }
        format.json { render json: @create_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_tweets/1
  # PATCH/PUT /create_tweets/1.json
  def update
    respond_to do |format|
      if @create_tweet.update(create_tweet_params)
        format.html { redirect_to @create_tweet, notice: 'Create tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_tweet }
      else
        format.html { render :edit }
        format.json { render json: @create_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_tweets/1
  # DELETE /create_tweets/1.json
  def destroy
    @create_tweet.destroy
    respond_to do |format|
      format.html { redirect_to create_tweets_url, notice: 'Create tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_tweet
      @create_tweet = CreateTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_tweet_params
      params.require(:create_tweet).permit(:text)
    end
end

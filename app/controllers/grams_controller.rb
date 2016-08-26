class GramsController < ApplicationController
  before_action :set_gram, only: [:show, :edit, :update, :destroy]
  require 'koala'
  require 'net/http'
  require 'uri'
  require 'nokogiri'
  require 'open-uri'

  # GET /grams
  # GET /grams.json
  def index
    @grams = Gram.all
    access_token = "EAALpr00PQKMBAFOQITLX5LroqQ7QfFMPmZBYCXiIdSJIssRPZCXoxU5KVFAUVMrSZB2Dc43NhyMjP40PZAZAwltPrCXMtcUKhltXUJbTdGLQzWlMKf6LnjeoNyA7R3ihbtS3pPLQDahMQECfBlRruVM3k3VqpZAA8ZD"
    # @graph = Koala::Facebook::API.new("EAALpr00PQKMBADd2VnHDk9FhezgoVMUjcuckkL0PIZCfgk3WQbKl2ydVCDAAkpJFcZAVwbZBBgpzVLG6cpSaEzNRPEm2UoRfJTfo0kVI7lZBQsFmvbAxb3kMXft3g0f3tYrzLaTqDmrVjKNhe8lLMFLSGbC2Q66DcqX6llDhCgZDZD")
    @graph = Koala::Facebook::API.new(access_token)
    profile = @graph.get_object("me")
    client = Koala::Facebook::API.new(access_token)
    posts = client.get_connection('me', 'posts?with=link',
                        {
                          fields: ['message', 'id', 'from', 'type',
                                    'picture', 'link', 'created_time', 'updated_time'
                            ]})

    message1 = posts.first['message']
    link1 = posts.first['link']
    uri = URI.parse("http://www.investopedia.com/articles/markets/072016/usoriented-companies-may-outperform-market.asp")
    # Full control
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri.request_uri)
    # request = Net::HTTP.get_response(uri)
    # request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    response = http.request(request)
    # @response = JSON.parse(response.body)
    re = Nokogiri::HTML(open(link1))
    re_image = re.css("meta[property='og:image']")
    re_title = re.css("meta[property='og:title']")
    re_desc  = re.css("meta[property='og:description']")

    @re_image_string = re_image.at('meta')['content']
    @re_title_string = re_title.at('meta')['content']
    # @re_desc_string  = re_desc.at('meta')['content']
    @re_desc_string = message1
    @link1 = link1
    # raise "hell"
    # Secon
    uri2 = URI.parse('http://www.investopedia.com/articles/basics/07/diversification-style.asp?article=1&utm_campaign=www.investopedia.com&utm_source=investing-basics&utm_term=7376183&utm_medium=email')
    http2 = Net::HTTP.new(uri2.host, uri2.port)
    request2 = Net::HTTP::Get.new(uri2.request_uri)
    response2 = http2.request(request2)

    message2 = posts.second['message']
    link2 = posts.second['link']

    # re2 = Nokogiri::HTML(open('http://www.investopedia.com/articles/etfs-mutual-funds/072416/5-reasons-find-asset-managers-who-use-etfs.asp?article=3&utm_campaign=www.investopedia.com&utm_source=investing-basics&utm_term=7235320&utm_medium=email'))
    re2 = Nokogiri::HTML(open(link2))
    re2_image = re2.css("meta[property='og:image']")
    re2_title = re2.css("meta[property='og:title']")
    re2_desc  = re2.css("meta[property='og:description']")

    @re2_image_string = re2_image.at('meta')['content']
    @re2_title_string = re2_title.at('meta')['content']
    # @re2_desc_string  = re2_desc.at('meta')['content']
    @re2_desc_string = message2
    @link2 = link2
  end

  def upload  
    @instas = Instagram.user_recent_media(@triumph_capital, {:count => 15})
    @instas.first(5).each_with_index do |insta, index|
      index_plus_one = index + 1
      this_insta = Gram.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
      this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
      this_insta.save
    end 
    render nothing: true, status: :ok, content_type: "text/html"
  end

  # GET /grams/1
  # GET /grams/1.json
  def show
  end

  # GET /grams/new
  def new
    @gram = Gram.new
  end

  # GET /grams/1/edit
  def edit
  end

  # POST /grams
  # POST /grams.json
  def create
    @gram = Gram.new(gram_params)

    respond_to do |format|
      if @gram.save
        format.html { redirect_to @gram, notice: 'Gram was successfully created.' }
        format.json { render :show, status: :created, location: @gram }
      else
        format.html { render :new }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grams/1
  # PATCH/PUT /grams/1.json
  def update
    respond_to do |format|
      if @gram.update(gram_params)
        format.html { redirect_to @gram, notice: 'Gram was successfully updated.' }
        format.json { render :show, status: :ok, location: @gram }
      else
        format.html { render :edit }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grams/1
  # DELETE /grams/1.json
  def destroy
    @gram.destroy
    respond_to do |format|
      format.html { redirect_to grams_url, notice: 'Gram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gram
      @gram = Gram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gram_params
      params.require(:gram).permit(:text, :image_url)
    end
end

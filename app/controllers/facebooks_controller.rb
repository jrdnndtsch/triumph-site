class FacebooksController < ApplicationController
  before_action :set_facebook, only: [:show, :edit, :update, :destroy]
  require 'koala'
  require 'nokogiri'
  require 'open-uri'


  # GET /facebooks
  # GET /facebooks.json
  def index
    @facebooks = Facebook.all
  end

  def upload
    client = Koala::Facebook::API.new(ENV['fb_access_token'])
    posts = client.get_connection('triumphcapitallimited', 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture', 'link', 'created_time', 'updated_time'
                        ]})

    posts.first(5).each_with_index do |fb, index|
      index_plus_one = index + 1

      if fb['link'].present?
        re = Nokogiri::HTML(open(fb['link']))
        re_image = re.css("meta[property='og:image']")
        re_title = re.css("meta[property='og:title']")
        re_desc  = re.css("meta[property='og:description']")

        if re_image.present? && re_title.present?
          re_image_string = re_image.at('meta')['content']
          re_title_string = re_title.at('meta')['content']
          re_desc_string  = re_desc.at('meta')['content']

          this_fb = Facebook.where(id: index_plus_one).first_or_initialize({message: fb['message'], link: fb['link'], image_link: re_image_string, title: re_title_string, description: re_desc_string  })
          this_fb.update({message: fb['message'], link: fb['link'], image_link: re_image_string, title: re_title_string, description: re_desc_string  })
          this_fb.save
        end
      end
    end
    render nothing: true, status: :ok, content_type: "text/html"
  end

  # GET /facebooks/1
  # GET /facebooks/1.json
  def show
  end

  # GET /facebooks/new
  def new
    @facebook = Facebook.new
  end

  # GET /facebooks/1/edit
  def edit
  end

  # POST /facebooks
  # POST /facebooks.json
  def create
    @facebook = Facebook.new(facebook_params)

    respond_to do |format|
      if @facebook.save
        format.html { redirect_to @facebook, notice: 'Facebook was successfully created.' }
        format.json { render :show, status: :created, location: @facebook }
      else
        format.html { render :new }
        format.json { render json: @facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebooks/1
  # PATCH/PUT /facebooks/1.json
  def update
    respond_to do |format|
      if @facebook.update(facebook_params)
        format.html { redirect_to @facebook, notice: 'Facebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook }
      else
        format.html { render :edit }
        format.json { render json: @facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebooks/1
  # DELETE /facebooks/1.json
  def destroy
    @facebook.destroy
    respond_to do |format|
      format.html { redirect_to facebooks_url, notice: 'Facebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook
      @facebook = Facebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_params
      params.require(:facebook).permit(:message, :link, :image_link, :title, :description)
    end
end

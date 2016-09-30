class RequestedQuotesController < ApplicationController
  # before_action :set_requested_quote, only: [:show, :edit, :update, :destroy]

  # GET /requested_quotes
  # GET /requested_quotes.json
  # def index
  #   @requested_quotes = RequestedQuote.all
  # end

  # GET /requested_quotes/1
  # GET /requested_quotes/1.json
  # def show
  # end

  # GET /requested_quotes/new
  # def new
  #   @requested_quote = RequestedQuote.new
  # end

  # GET /requested_quotes/1/edit
  # def edit
  # end

  # POST /requested_quotes
  # POST /requested_quotes.json
  def create
    @requested_quote = RequestedQuote.new(requested_quote_params)

    respond_to do |format|
      if @requested_quote.save
        format.html { redirect_to root_path, notice: 'Requested quote was successfully created.' }
        format.json { render :show, status: :created, location: @requested_quote }
      else
        format.html { render :new }
        # format.json { render json: @requested_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requested_quotes/1
  # PATCH/PUT /requested_quotes/1.json
  # def update
  #   respond_to do |format|
  #     if @requested_quote.update(requested_quote_params)
  #       format.html { redirect_to @requested_quote, notice: 'Requested quote was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @requested_quote }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @requested_quote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /requested_quotes/1
  # DELETE /requested_quotes/1.json
  # def destroy
  #   @requested_quote.destroy
  #   respond_to do |format|
  #     format.html { redirect_to requested_quotes_url, notice: 'Requested quote was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_requested_quote
    #   @requested_quote = RequestedQuote.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requested_quote_params
      params.require(:requested_quote).permit(:first_name, :last_name, :email, :phone, :comments)
    end
end

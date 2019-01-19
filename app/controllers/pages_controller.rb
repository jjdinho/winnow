class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :check_format, only: :home_search_query

  def home
    redirect_to news_feeds_path and return if current_user
    # newsapi = News.new(ENV['NEWS_API_KEY'])
    # @sources = newsapi.get_sources(country: 'us', language: 'en')

    @search_query = NewsFeed.new
  end

  def home_2
    render layout: 'no_navbar'
  end

  def home_3
    render layout: 'no_navbar'
  end

  def home_4
    raise
    render layout: 'no_navbar'
  end

  def home_5
    raise
    render layout: 'no_navbar'
  end

  def home_search_query
    newsapi = News.new(ENV['NEWS_API_KEY'])
    search_sources = params[:sources]
    @search_result = newsapi.get_everything(q: params[:query],
                                            sources: search_sources,
                                            from: (Date.today - 7).to_s,
                                            to: Date.today.to_s,
                                            language: 'en',
                                            sortBy: 'relevancy',
                                            pageSize: 100).first(10)
    respond_to do |format|
      format.json { render json: @search_result }
    end
  end

  def awesome_llama_1
    email = params[:email]
    hex = SecurityHex.create(hex: SecureRandom.hex)
    redirect_to home_2_path email: email, hex: hex
  end

  def awesome_llama_2
    hex = params[:hex]
    raise unless SecurityHex.find_by(hex: hex)
    email = params[:email]
    password = params[:password]
    new_user = User.new(email: email, password: password, password_confirmation: password)
    if new_user.save
      sign_in(new_user)
      redirect_to home_3_path(hex: hex), notice: "Welcome, #{current_user.email}!"
    else
      redirect_to root_path, alert: 'Error'
    end
  end

  def awesome_llama_3
    email = params[:email]
    password = params[:password]
  end

  def awesome_llama_4
    email = params[:email]
    password = params[:password]
  end

  def awesome_llama_5
    email = params[:email]
    password = params[:password]
  end

  private

  def check_format
    redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :check_format, only: :home_search_query
  before_action :check_hex, only: [:awesome_llama_2, :awesome_llama_3,
    :awesome_llama_4, :awesome_llama_5]

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
    render layout: 'no_navbar'
  end

  def home_5
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
    security_hex = SecurityHex.new(hex: SecureRandom.hex)
    security_hex.save!
    hex = security_hex.hex
    redirect_to home_2_path email: email, hex: hex
  end

  def awesome_llama_2
    email = params[:email]
    password = params[:password]
    new_user = User.new(email: email, password: password, password_confirmation: password)
    if new_user.save
      sign_in(new_user)
      redirect_to home_3_path(hex: @hex), notice: "Welcome, #{current_user.email}!"
    else
      redirect_to root_path, alert: 'Error'
    end
  end

  def awesome_llama_3
    keyword = params[:keyword]
    redirect_to home_4_path(hex: @hex, keyword: keyword)
  end

  def awesome_llama_4
    keyword = params[:keyword]
    frequency = params[:frequency]
    redirect_to home_5_path(hex: @hex, keyword: keyword, frequency: frequency)
  end

  def awesome_llama_5
    news_feed = NewsFeed.new(news_feed_params)
    news_feed.user = current_user
    if news_feed.save
      redirect_to yay_you_did_it_path, notice: 'Woohoo!'
    else
      redirect_to root_path, alert: 'Fail'
    end
  end

  def yay_you_did_it
    authorize current_user
  end

  private

  def check_format
    redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
  end

  def check_hex
    @hex = params[:hex]
    raise unless SecurityHex.find_by(hex: @hex)
  end

  def news_feed_params
    params.require(:news_feed).permit(:frequency, :keyword, news_source_ids: [])
  end
end

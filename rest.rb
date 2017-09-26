require "twitter"

require 'dotenv'
Dotenv.load ".env"

class TwitterClient

  attr_reader = :client

  def initialize()
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['OAUTH_TOKEN']
      config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
  end

  def twieet(str)
    @client.update(str)
  end
  
  # 自分のプロフィールを表示
  def show_my_profile
    puts @client.user.screen_name   # アカウントID
    puts @client.user.name          # アカウント名
    puts @client.user.description   # プロフィール
    puts @client.user.tweets_count  # ツイート数
  end

  # 指定したアカウントのプロフィールを表示
  def show_user_profile(user_name)
    user = @client.user(user_name)
    puts user.screen_name  #アカウントID
    puts user.id  #アカウントID
    puts user.name         # アカウント名
    puts user.description  # プロフィール
    puts user.tweets_count # ツイート数
    user
  end

  # タイムラインの表示
  def show_timeline
    @client.home_timeline.each do |tweet|
      puts tweet.full_text
      puts "FAVORITE: #{tweet.favorite_count}"
      puts "RETWEET : #{tweet.retweet_count}"
    end
  end

  # 指定数の最新のツイートを表示
  def show_recently_twieet(user_name, twieet_count)
    @client.user_timeline(user_name, { count: twieet_count } ).each do |timeline|
      tweet = @client.status(timeline.id)
      puts tweet.created_at
      puts tweet.text
    end
  end

  # 指定ワードを検索。param:countは件数
  def search(word, count)
    @client.search(word).take(count).each do |tweet|
      tweet
    end
  end
end

user_id = '@tuyopanman'
agent = TwitterClient.new
profile = agent.show_user_profile(user_id)
p profile.profile_banner_uri
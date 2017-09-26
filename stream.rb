require "twitter"
require 'open-uri'

require 'dotenv'
Dotenv.load ".env"

client_rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['OAUTH_TOKEN']
  config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
end

@stream_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['OAUTH_TOKEN']
  config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
end

topics = ["ruby", "python"]

# @stream_client.filter({:track =>  'ruby,Java' }) do |status|
#   p status.text
# end
  
# @stream_client.sample do |status|
# @stream_client.filter(:follow => '909724056118730752,1084809481') do |status|
# @stream_client.filter(:track => "#naruto") do |status|
cnt = 0
@stream_client.sample do |status|
  case status
  when Twitter::Tweet
    if status.lang == 'ja' and not status.text =~ /[RT|@|http|#]/
      if cnt == 0
        puts status.text
        puts ">>#{status.user.name}  @#{status.user.screen_name}"
        cnt = 10
      end
      cnt -= 1
    end
  else
    # p status
  end
end
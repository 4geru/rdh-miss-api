require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'net/http'
require 'json'
require 'dotenv'
require 'uri'
require './request'
Dotenv.load ".env"


get '/api/typo' do
    # baseのURLを設定
    word = "大丈夫です"
    proofreading(word)
end

get '/' do
    erb :index
end
# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'sinatra-contrib'
gem "activerecord", "< 5.0.0"
gem 'sinatra-activerecord'
gem 'rake'
gem 'dotenv'
gem 'twitter'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

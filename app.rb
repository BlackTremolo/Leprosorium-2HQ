require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium-2.db"}

class Post <ActiveRecord::Base
end

class Comment <ActiveRecord::Base
end

get '/' do 

	erb :posts
end

get '/new' do 

	erb :new
end

post '/new' do
	@p = Post.new params[:post] 

	erb 'You typed post' 

end
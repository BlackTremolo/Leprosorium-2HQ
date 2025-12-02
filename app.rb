require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium-2.db"}

class Post <ActiveRecord::Base
	validates :author, presence: true
	validates :content, presence: true, length: {minimum: 1}
end

class Comment <ActiveRecord::Base
	validates :author, presence: true
	validates :content, presence: true, length: {minimum: 1}
end

get '/' do 

	erb :posts
end

get '/new' do 

	erb :new
end

post '/new' do
	@p = Post.new params[:post] 

	if @p.save
		erb 'You typed post'
	else
		@error = @c.errors.full_messages.first
		erb :visit	
	end
end
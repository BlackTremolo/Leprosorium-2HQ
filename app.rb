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

# before do 
# 	@c = Client.new
# end
get '/' do 
	@posts = Post.all
	
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
		@error = @p.errors.full_messages.first
		erb :new	
	end
end

get '/post/:id' do 
	$post = Post.find(params[:id])

	 @c = Comment.new
	 @c.post_id = params[:id]  
	
	erb :post
end

post '/post/:id' do 
	$post
	@c = Comment.new params[:comment]
	@c.post_id = params[:id]  

	if @c.save
		erb :post
	else
		@error = @c.errors.full_messages.first
		erb :post	
	end
end
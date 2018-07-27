     
require 'sinatra' 
#require 'sinatra/reloader'
require 'pg'
require 'pry'



def run_sql(sql)
  conn = PG.connect(dbname: 'applebite')
  result = conn.exec(sql)
  conn.close
  return result
end

require_relative 'db_config'
require_relative 'models/adpost'
require_relative 'models/user'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    # double negation for current_user to boolean vs. if then true and false
    !!current_user #user object or nil
  end
end


get '/' do
  #select each of the unique categories (iPhone, Mac etc) and display max. 3 on the main Nav Bar
  @category = Adpost.select(:category).distinct
  @adposts = Adpost.where(category: 'iPhone').order(post_date: :desc).order(post_time: :desc).first(3)

  if logged_in? && current_user.adposts.any?
   @user_adposts_flag=true
  end
  erb :index
end

get '/about' do
  return 'about me me me'
end

get '/category/new' do
  erb :new
end

get '/category/:cat' do
  #grab the category from params and set the @category to iPhone, Mac, iPad etc. 
  @category=params[:cat]
  #get from db the records that match the category and order in descending by the most current posting based on date and time.
  @adposts = Adpost.where(category:@category).order(post_date: :desc).order(post_time: :desc)
  erb :category
end

get '/category/:cat/:id' do
  @adpost_id=params[:id]
  @adpost = Adpost.find(@adpost_id)
  erb :adpost_detail
end


post '/category' do
  # inputs from the form - is inside params
  adpost = Adpost.new
  adpost.category=params[:category]
  adpost.post_date=Date.today
  adpost.post_time=Time.now
  adpost.title = params[:title]
  adpost.image_url1 = params[:image_url1]
  adpost.description = params[:description]
  adpost.model = params[:model]
  adpost.price = params[:price]
  adpost.condition = params[:condition]
  adpost.user_id = current_user.id
  adpost.save
  # get post redirect
  redirect '/' # needs to a route - because its making a request
  # get is safe and harmless, post is danger
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.new
  user.email=params[:email]
  user.password=params[:password]
  user.save
  redirect '/'

end

get '/login' do
  erb :login
end

post '/session' do
  # grab email and password
  # find the user by email
  user = User.find_by(email: params[:email])
  # authenticate user with password
  if user && user.authenticate(params[:password])
  # create new session
  session[:user_id] = user.id
  # redirect to secret page
  redirect '/'
  else 
    erb :login
  end
end

delete '/session' do
  #delete the session
  session[:user_id] = nil
  #redirect to /login
  redirect '/'
end


get '/admanage' do
    @adposts = current_user.adposts.order(post_date: :desc).order(post_time: :desc)
    erb :admanage
end

delete '/category/:cat/:id' do
  @adpost_id=params[:id]
  @adpost = Adpost.find(@adpost_id)
  @adpost.destroy
  
  redirect '/'
  "danger!!!!"
end

get '/category/:cat/:id' do
  @adpost_id=params[:id]
  @adpost = Adpost.find(@adpost_id)
  erb :adpost_detail
end

get '/category/:cat/:id/edit' do
  #result = run_sql("SELECT * FROM dishes WHERE id = #{ params[:id] #}")
  #@dish = result.first
  @adpost_id=params[:id]
  @adpost = Adpost.find(@adpost_id)
  erb :edit 
end

put '/category/:cat/:id' do
  redirect '/login' unless logged_in?

  adpost = Adpost.find(params[:id])
  adpost.category=params[:category]
  adpost.post_date=Date.today
  adpost.post_time=Time.now
  adpost.title = params[:title]
  adpost.image_url1 = params[:image_url1]
  adpost.description = params[:description]
  adpost.model = params[:model]
  adpost.price = params[:price]
  adpost.condition = params[:condition]
  adpost.user_id = current_user.id
  adpost.save
  
  redirect "/category/#{adpost.category}/#{adpost.id}"
  # run the sql
  # redirect
end

adpost = Adpost.new
  
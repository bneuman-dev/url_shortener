get '/' do
  # Look in app/views/index.erb
  @all_urls = Url.all
  erb :index
end

get '/login' do
  erb :login
end

get '/new' do
  erb :new
end

get '/logout' do
  session.delete(:user_id)
  redirect to "/"
end



post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect to "/users/#{user.id}/"
  else
    redirect to "/login"
  end
end

get "/users/:user_id/" do
  if session[:user_id].to_i == params[:user_id].to_i
    @urls = Url.where(user_id: params[:user_id])
    erb :user
  else
    redirect '/'
  end
end

post '/create' do
  user = User.create(params)
  session[:user_id] = user.id
  redirect to "/users/#{user.id}/"
end

post '/urls' do
  url = params[:url]
  user_id = session[:user_id]
  if user_id
    Url.create(url: url, user_id: user_id)
    redirect "/users/#{user_id}/"
  else
    Url.create(url: url)
    redirect "/"
  end
end

get '/:short_url' do
  # redirect to appropriate "long" URL
  short_url = params[:short_url]
  url = Url.find_by_short_url(short_url)
  url.click_count += 1
  url.save
  redirect to(url.url)
end


# get '/' do
#   # let user create new short URL, display a list of shortened URLs
# end

# post '/urls' do
#   # create a new Url
# end

# # e.g., /q6bda
# get '/:short_url' do
#   # redirect to appropriate "long" URL
# end

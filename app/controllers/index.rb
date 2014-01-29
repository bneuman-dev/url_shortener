get '/' do
  # Look in app/views/index.erb
  @all_urls = Url.all
  erb :index
end

get '/:short_url' do
  # redirect to appropriate "long" URL
  short_url = params[:short_url]
  url = Url.find_by_short_url(short_url)
  url.click_count += 1
  url.save
  redirect to(url.url)
end

post '/urls' do
  url = params[:url]
  short_url = "hi"
  Url.create(url: url, short_url: short_url)
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

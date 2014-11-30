def not_login?
  return true if session[:username].nil?
  return false
end

def logout
  session[:username] = nil
  redirect to('/login')
end

get '/' do
  erb :index
end

get '/login' do
  erb :index
end

post '/login' do
  if @user = User.authenticate(params[:user][:email], params[:user][:encrypted_password])
    session[:username] = @user.username
    redirect to ('/home')
  else
    redirect to ('/error')
  end
end

get '/home' do
  if not_login?
    redirect to ('/error')
  end
  erb :home
end

get '/error' do
  erb :error
end

get '/account/new' do
  erb :new_user
end

post '/account/new' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:username] = @user.username
    redirect to('/home')
  else
    redirect to('/invalid')
  end
end

get '/logout' do
  session[:username] = nil
  erb :logout
end

get '/invalid' do
  erb :invalid
end

get '/forgot' do
  erb :forgot
end

# get '/foo' do
#   session[:message] = 'Hello World!'
#   redirect to('/bar')
# end

# get '/bar' do
#   session[:message]   # => 'Hello World!'
# end

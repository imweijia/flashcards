post '/users/login' do
  @user = User.where(username: params[:username]).first
  unless @user == nil
    if @user.authentication(params[:password])
      session[:user_id] = @user.id
      redirect to("/users/#{@user.id}")
    else
      redirect to("/error")
    end
  end
end

get '/users/:id' do
  @decks = Deck.all
  @user = User.find(params[:id])
  @rounds = @user.rounds
  erb :profile
end
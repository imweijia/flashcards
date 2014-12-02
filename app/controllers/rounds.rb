get '/new/round/:id' do
  deck = Deck.find(params[:id])
  p deck
  user = User.find(session[:user_id])
  round = Round.create(user: user, deck: deck)
  redirect to ("/new/round/#{round.id}/guess/0")
end

get '/new/round/:id/guess/:g_id' do
  unless params[:g_id].to_i == 0
    g = Guess.find(params[:g_id])
    @correctness = g.correctness
  end
  @round = Round.find(params[:id])
  draw_deck = Card.where(deck_id: @round.deck_id)
  @specific_card = draw_deck.sample

  erb :guess_game
end

post '/new/round/:id/guess/card/:c_id' do
  params[:answer].downcase!
  @specific_card = Card.find(params[:c_id])
  g = Guess.create(round_id: params[:id], answer: params[:answer], card: @specific_card, correctness: @specific_card.check_answer(params[:answer]))
  @round = Round.find(params[:id])

  unless g.correctness
    @round.chances -= 1
    @round.save
  else
    @round.score += 1
    @round.save
  end

  if @round.chances != 0
    redirect to ("/new/round/#{params[:id]}/guess/#{g.id}")
  else
    erb :gameover
  end
end
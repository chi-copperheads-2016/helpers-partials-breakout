get '/wines' do
  @wines = Wine.all
  erb :"wines/index"
end

get '/wines/new' do
  auth_check
  @wine = Wine.new
  erb :"wines/new"
end

post '/wines' do
  auth_check
  @wine = Wine.new(params[:wine])

  if @wine.save
    current_user.wines << @wine
    redirect '/wines'
  else
    erb :"wines/new"
  end

end

get '/wines/:id/edit' do
  auth_check
  find_wine
  check_owner(@wine)
  erb :"wines/edit"
end

put '/wines/:id' do
  find_wine
  check_owner(@wine)

  if @wine.update_attributes(params[:wine])
    redirect '/wines'
  else
    erb :"wines/new"
  end
end

get '/wines/:id' do
  find_wine
  erb :"wines/show"
end

delete '/wines/:id' do
  auth_check
  find_wine
  check_owner(@wine)

  @wine.delete
  redirect '/wines'
end
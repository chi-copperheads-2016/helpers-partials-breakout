get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by(username: params[:username])

  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/"
  else
    erb :'/sessions/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end


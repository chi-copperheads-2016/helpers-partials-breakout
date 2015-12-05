get '/' do
  redirect '/wines'
end

get '/badplace' do
  erb :bad_place
end
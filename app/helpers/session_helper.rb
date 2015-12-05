def current_user
  @current_user ||= User.find(session[:id]) if authenticated?
end

def authenticated?
  session[:id] != nil
end

def auth_check
  redirect '/sessions/new' unless authenticated?
end

def check_owner(obj)
  redirect '/badplace' unless mine?(obj)
end

def mine?(obj)
  obj.user.id == current_user.id
end
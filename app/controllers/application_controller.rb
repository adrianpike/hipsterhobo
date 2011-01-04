class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def require_admin
    auth = Rack::Auth::Basic::Request.new(request.env)
    unless auth.provided? and authorize(*auth.credentials)
      response['WWW-Authenticate'] = %(Basic realm="TELL ME ABOUT YOUR STREET CRED")
      render :nothing => true, :status => 401
    end
  end
  
  def authorize(username, password)
    # I'm setting these in an intitializer that's in my .gitignore. TODO: use a heroku setting
    username == (ADMIN_USERNAME || ENV['USERNAME'])
    password == (ADMIN_PASSWORD || ENV['PASSWORD'])
  end
end

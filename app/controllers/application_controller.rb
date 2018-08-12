class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: 'hello, world!'
  end

  private
    def logged_in_user
      redirect_to root_url unless logged_in?
    end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_variables

def set_variables
  @all_chapters = Chapter.all
  @chapter = Chapter.find(1)
  @show_verses_in_nav = false
end

  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end

end

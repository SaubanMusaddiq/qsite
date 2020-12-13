class WelcomeController < ApplicationController
  def index
  	@all_chapters = Chapter.all
  	# redirect_to url_for(controller: "chapters", action: "index")
  	@first_half_chapters = Chapter.first_half
  	@second_half_chapters = Chapter.second_half
  end
end

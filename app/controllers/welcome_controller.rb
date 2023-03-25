class WelcomeController < ApplicationController
  def index
  	@all_chapters = Chapter.all
  	# redirect_to url_for(controller: "chapters", action: "index")
  	@first_half_chapters = Chapter.first_half
  	@second_half_chapters = Chapter.second_half
  end

  def intro
  end

  def info
    file_name =  File.join(File.dirname(__FILE__), "../assets/text/Information.txt")
    puts(file_name)
    @lines = File.open(file_name,"r:UTF-16LE").map{|line| line.encode('utf-8')}
  end

  def publisher
  end

  def notes
  end

  def contact
  end

end

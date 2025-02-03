class WelcomeController < ApplicationController
  def index
  	@all_chapters = Chapter.all
  	# redirect_to url_for(controller: "chapters", action: "index")
  	@first_third_chapters = Chapter.first_third
  	@second_third_chapters = Chapter.second_third
    @third_third_chapters = Chapter.third_third
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

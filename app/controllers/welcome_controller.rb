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
    file_name = "/home/sauban/campus/sites/qsite/qsite/qsite/public/text/Information.txt"
    @lines = File.open(file_name,"r:UTF-16LE").map{|line| line.encode('utf-8')}
    puts @lines
  end

  def publisher
  end

end

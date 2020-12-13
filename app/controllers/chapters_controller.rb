class ChaptersController < ApplicationController
  def index
    @all_chapters = Chapter.all
  end
  def show
  	@all_chapters = Chapter.all
  	@chapter = Chapter.find(params[:id])
  	@all_verses = @chapter.verses
  end	
end

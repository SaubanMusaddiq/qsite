class ChaptersController < ApplicationController
  def index
  end
  def show
  	@chapter = Chapter.find(params[:id])
  	@all_verses = @chapter.verses
    @show_verses_in_nav = true
  end
end

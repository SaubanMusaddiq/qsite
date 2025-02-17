class ChaptersController < ApplicationController
  helper_method :format_note_links

  def index
  end
  def show
  	@chapter = Chapter.find(params[:id])
  	@all_trans = @chapter.translations
    @show_verses_in_nav = true
  end

  def format_note_links(content)
    content.gsub(/\d{1,3}/) do |num|
      "<sup><a class='note-link' onclick=\"showModalContent(#{num})\">#{num}</a></sup>"
    end.html_safe
  end
end

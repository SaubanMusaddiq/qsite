class VersesController < ApplicationController
	def show
		@chapter = Chapter.find(params[:id])
		first = last = 1 #suppose if first is 0 or less
		first = last = params[:v_id1].to_i if(params[:v_id1].to_i >1)
		if(params[:v_id2].present?)
			last = params[:v_id2].to_i
		end
		@verses = @chapter.verses_in_range(first,last)
	end
end

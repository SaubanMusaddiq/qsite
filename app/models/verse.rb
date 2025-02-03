class Verse < ApplicationRecord
	belongs_to :chapter
	def translation 
		self.chapter.get_translation self.number
	end	

	def notes
		numbers = self.translation.content.scan(/\d{1,3}/)
	    notes = numbers.map { |number| self.chapter.get_notes(number.to_i) }
	end	

	def update_content content
		self.content = content
		self.save
	end	
end

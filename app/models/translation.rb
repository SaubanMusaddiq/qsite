class Translation < ApplicationRecord
	belongs_to :chapter

	def notes
		numbers = self.content.scan(/\d{1,3}/)
	    notes = numbers.map { |number| self.chapter.get_notes(number.to_i) }
	end	

	def verses_content
		self.chapter.get_verse_range(self.number,self.number_end)
	end

	def update_content content
		self.content = content
		self.save
	end

end

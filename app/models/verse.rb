class Verse < ApplicationRecord
	belongs_to :chapter

	def translation 
		self.chapter.get_translation self.number
	end	

	def update_content content
		self.content = content
		self.save
	end	
end

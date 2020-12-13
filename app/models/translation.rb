class Translation < ApplicationRecord
	belongs_to :chapter
	def verse
		self.chapter.get_verse self.number
	end

	def update_content content
		self.content = content
		self.save
	end
end

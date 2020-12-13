class Chapter < ApplicationRecord
	has_many :verses
	has_many :notes
	has_many :translations
	def get_translation number
		self.translations.find_by_number number
	end
	def get_verse number
		self.verses.find_by_number number
	end

	def verses_in_range first,last
		self.verses.limit(last-first+1).offset(first-1)
	end	

	def verse_count
		self.verses.count
	end

	def self.first_half 
		self.where(id: 1..57)
	end
	def self.second_half 
		self.where(id: 58..114)
	end		
end

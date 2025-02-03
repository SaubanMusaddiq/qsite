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
	def get_verse_range start_number,end_number
		contents = self.verses.where(number: start_number..end_number).pluck(:content)
		a= contents.join('<span class="ayah-period">۞</span> ')
		a.html_safe	
	end

	def get_notes number
		self.notes.where(chapter_id: self.id, number: number).first
	end

	def verses_in_range first,last
		self.verses.limit(last-first+1).offset(first-1)
	end	

	def verse_ranges
		self.verses.map {|verse| [verse.number, verse.number_end]}
	end

	# def self.first_half
	# 	self.where(id: 1..57)
	# end
	# def self.second_half 
	# 	self.where(id: 58..114)
	# end	

	def self.first_third
		ids = (1..114).step(3).to_a
		self.where(id: ids)
	end
	def self.second_third
		ids = (2..114).step(3).to_a
		self.where(id: ids)
	end
	def self.third_third
		ids = (3..114).step(3).to_a
		self.where(id: ids)
	end	
end

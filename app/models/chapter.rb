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
  
 		a = contents.map.with_index(start_number) do |content, index|
    		"#{content}</span><span class='ayah-period-1'>#{to_arabic_number(index)}</span><span>"
  		end.join
  
  		a = "<span>" + a + "<span>"
  		a.html_safe
	end

	def to_arabic_number(number)
	  western_to_arabic = {
	    '0' => '٠', 
	    '1' => '١', 
	    '2' => '٢', 
	    '3' => '٣', 
	    '4' => '٤', 
	    '5' => '٥', 
	    '6' => '٦', 
	    '7' => '٧', 
	    '8' => '٨', 
	    '9' => '٩'
	  }
	  
	  number.to_s.chars.map { |digit| western_to_arabic[digit] }.reverse.join
	end

	def get_notes number
		self.notes.where(chapter_id: self.id, number: number).first
	end

	def self.get_all_notes id
		self.notes.where(chapter_id: id)
	end

	def verses_in_range first,last
		self.verses.limit(last-first+1).offset(first-1)
	end	

	def verse_ranges
		self.translations.map {|t| [t.number, t.number_end]}
	end

	def intro
		self.info.gsub("$\n$","$\n\n$").gsub("\n$", "<p class='ch-intro-sub'>").gsub("$\n", "</p>").gsub("\n","</br>").html_safe
	end	

	# def self.first_half
	# 	self.where(id: 1..57)
	# end
	# def self.second_half 
	# 	self.where(id: 58..114)
	# end	

	def self.all_chapters
		self.all
	end

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

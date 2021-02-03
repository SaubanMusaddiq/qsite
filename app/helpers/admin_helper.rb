module AdminHelper
	def text_to_db chap_id,fn
		mode = "r"
		begin
			fi = `file -i #{fn}`
		rescue Exception => e
			puts e.message
		end
		mode = "r:UTF-16LE" if (fi.split("charset=")[1].strip == "utf-16le")
		#fix non file error
		#the problem is how to add delay betn fix_f_n text_to_db
		# maybe, not use `..how to handle error
		#

		ar = File.open(fn,mode).map{|line|line.encode('utf-8')}
		chap = ar[0].split('.')
		chap_number = chap[0][/\d+/].to_i
		chap = chap[1].split('(')
		chap_name = chap[0].strip
		chap =  chap[1].split(')')
		chap_trans = chap[0].strip
		chap_origin = chap[1].split(",").join(" ").strip     #bad code
		c= Chapter.find(chap_id)
		c.title_kn = chap_name unless chap_name.nil?
		c.title_trans_kn = chap_trans unless chap_trans.nil?
		c.origin = chap_origin unless chap_origin.nil?
		c.save

		# offset = ( chap_number == 1  ||chap_number == 9) ? 0 : 1;
		(1..ar.size-2).each do|i|
			tp = ar[i+1].split('.') #bad code
			tp.shift()
			trans_content =  tp.join(".")
			t = c.get_translation i
			t.update_content(trans_content) unless trans_content.nil?
			v = c.get_verse i
			v.update_content("This is verse #{i} of chapter #{c.id}")
		end
	end
	def fix_file_name(fn)
		File.rename(fn,fn.split(" ").join("_").split("'").join("")) #bad code
	end

	def json_arabic_to_db(fn)
		ff=File.open(fn,"r")
		data = eval(ff.read())
		ch = Chapter.find(data[:index].to_i)
		if(data[:count] != ch.verses.count)
			raise 'Verse Count Doesnt match: Surah#{data[:index].to_i}'
			return data[:index]
		end
		ch[:title_en] = data[:name]
		ch.save
		# (1..data[:count]).each do |i|
		#   vs = ch.verses.find_by_number(i)
		#   vs.content = data[:verse]["verse_#{i}".to_sym]
		#   vs.save
		# end
		return data[:index]
	end

	def update_surahs chap_id, data, type
		ch= Chapter.find(chap_id)
		lines =  (type=='ar'? ch.verses : ch.translations)
		arr = data.split("\n")
		(1..(arr.length-1)).each do |i|
			words = arr[i].split(" ")
			words.shift()
			line = lines.find_by_number(i)
			if(line)
				line.update_content(words.join(" "))
			end
		end
	end

	# fn="/home/infibeam/personal_ws/qrn_pjt/Quran_app/qrnsite/public/unicode/k.txt"
	# fw="/home/infibeam/personal_ws/qrn_pjt/Quran_app/qrnsite/public/unicode/02.txt"
end

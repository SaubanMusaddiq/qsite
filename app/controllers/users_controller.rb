class UsersController < ApplicationController
	include AdminHelper
	before_action :authenticate_user
	def admin

	end
	def analytics
	end
	def configs
	end
	def files
		@all_chapters = Chapter.all
	end
	def file_save
		@all_chapters = Chapter.all
		if update_chapter_data params[:file]
			flash[:notice] = "Changes successfully updated"
		else
			flash[:error] = "Something Went Wrong"
		end
		redirect_to admin_files_path
	end


	def download_file_ar
	    ch = Chapter.find(params[:id])
	    send_data generate_file(ch,"ar"),
	              filename: "arabic_#{ch.number}.txt",
	              type: "text/plain"
	end

	def download_file_kn
	    ch = Chapter.find(params[:id])
	    send_data generate_file(ch,"kn"),
              filename:  "kannada_#{ch.number}.txt",
              type: "text/plain"
	end

	private
		def generate_file(ch,type)
			file = ""
			file << ch.number.to_s+"\n"
			lines =  (type=='ar'? ch.verses : ch.translations)
			file << lines.map{|l| "#{l.number.to_s} #{l.content.strip}"}.join("\n")
		end

		def update_chapter_data data
			chap = Chapter.find_by_number(data[:ch_no])
			chap.title_ar = data[:title_ar]
			chap.title_kn = data[:title_kn]
			chap.title_en = data[:title_en]
			chap.title_trans_kn = data[:title_trans_kn]
			return false if !chap.save
			if data[:file_kn]
				File.open(data[:file_kn].path(), "r:UTF-8") do |f|
				  uploaded_file_kn = f.read
					update_surahs chap.id, uploaded_file_kn, "kn"
				end
			end
			if data[:file_ar]
				uploaded_file_ar = data[:file_ar].read
				update_surahs chap.id, uploaded_file_ar, "ar"
			end
			return true
		end
end

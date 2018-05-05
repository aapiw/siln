module ApplicationHelper

def active_class(link_path, link_path2=nil)
	if link_path.present? and link_path2.present?
		if current_page?(link_path)
			"active"		
		elsif current_page?(link_path2)
			"active"
		end
	else
	 current_page?(link_path) ? "active" : "" 
	end
end

def is_image? obj_paperclip
  %w(image/jpeg image/jpg image/png).include?(obj_paperclip.content_type)
end

def is_pdf? obj_paperclip
  %w(application/pdf).include?(obj_paperclip.content_type)
end

def see_donwload paperclip_obj, caption
	html = "<div class='col-12 mb-3 mt-3'>"
	if is_image?(paperclip_obj)
		html += "<a data-fancybox='gallery' href='#{paperclip_obj.url}' data-caption='#{caption}'>Lihat Image</a>"
		html+=" | "
		html += "<a href='#{paperclip_obj.url}' download='#{ caption +" "+@teacher.name.titleize rescue nil }'>Download Image</a>"
	else
		html += "<a href='#{paperclip_obj.url}' >Lihat PDF</a>"
		html+=" | "
		html += "<a href='#{paperclip_obj.url}' download='#{ caption +" "+@teacher.name.titleize rescue nil }'>Download PDF</a>"
	end

	html += "</div>"
	return html.html_safe if paperclip_obj.present?
	return "" if paperclip_obj.blank?
end

end

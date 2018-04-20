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

end

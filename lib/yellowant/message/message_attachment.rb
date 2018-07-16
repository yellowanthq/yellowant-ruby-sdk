require_relative 'message_attachment'
require_relative 'button_class'
require_relative '../exceptions'

module Messages
	class MessageAttachment
		attr_accessor :image_url, :thumb_url, :color, :text, :author_name, :author_link, :author_icon, :footer,
						:footer_icon, :pretext, :title, :title_link, :status, :ts 
		def initialize
			@image_url = ''
			@thumb_url = ''
			@color = ''
			@text = ''
			@author_name = ''
			@author_link = ''
			@author_icon = ''
			@footer = ''
			@footer_icon = ''
			@pretext = ''
			@title = ''
			@title_link = ''
			@status = 0
			@ts = 0
			@fields = Array.new
			@buttons = Array.new
		end

		def attach_field(field)
			if !field.is_a? AttachmentClass
				raise YellowantExceptions::YellowAntError, "Attachment must be 'AttachmentClass' class" 
			else
				@fields << field.get_dict
			end
		end

		def attach_button(button)
			if !field.is_a? ButtonClass
				raise YellowantExceptions::YellowAntError, "Attachment must be 'AttachmentClass' class" 
			else
				@buttons << button.get_dict
			end
		end

		def get_dict
			if !@status.is_a? Integer
				raise YellowantExceptions::YellowAntError, ":status must be an integer"
			elsif !@ts.is_a? Integer 
				raise YellowantExceptions::YellowAntError, ":ts must be an integer"
			end
			{"image_url"=> @image_url, "thumb_url"=> @thumb_url, "color"=> @color, "text"=> @text, "author_name"=> @author_name, 
			"author_icon"=> @author_icon, "author_link"=> @author_link, "ts"=> @ts, "footer"=> @footer, "footer_icon"=> @footer_icon, 
			"pretext"=> @pretext, "title"=> @title, "title_link"=> @title_link, "status"=> @status, "fields"=> @fields,
			"buttons"=> @buttons}
		end
	end
end

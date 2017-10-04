require_relative 'message_attachment'
require_relative '../exceptions'
require 'json'

module Messages
	class MessageClass
		attr_accessor :message_text, :attachments, :data, :error, :logs
		def initialize
			@message_text = ''
			@attachments = []
			@data = {}
			@error = {}
			@logs = {}
		end

		def attach(attachment)
			if !attachment.is_a? MessageAttachment 
				raise YellowantExceptions::YellowAntError, "Attachment must be MessageAttachment class"
			end
			@attachments << attachment.get_dict
		end

		def to_json
			m = {"message_text" => @message_text, "data"=> @data, "error" => @error, "attachments"=> @attachments, "logs"=> @logs}
			JSON.generate(m)
		end

		def get_dict
			{"message_text" => @message_text, "data"=> @data, "error" => @error, "attachments"=> @attachments, "logs"=> @logs}
		end

	end
end
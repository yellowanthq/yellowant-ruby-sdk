require_relative '../exceptions'
module Messages
	class AttachmentClass
		attr_accessor :title, :short, :value
		def initialize 
			@title = ''
			@short = 0
			@value = ''
		end

		def get_dict
			if !short.is_a? Integer
				raise YellowantExceptions::YellowAntError, ":short must be an integer"
			else
				{"title"=>@title, "short"=>@short, "value" => @value}
			end
		end
	end
end
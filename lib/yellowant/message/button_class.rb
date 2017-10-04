require_relative '../exceptions'
module Messages
	class ButtonClass
		attr_accessor :value, :name, :text, :command
		def initialize
			@value = ''
			@name = ''
			@text = ''
			@command = {}
		end

		def get_dict
			{"value"=> @value, "name"=> @name, "text"=>@text, "command" => @command}
		end
	end
end

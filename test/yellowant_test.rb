require "test_helper"

class YellowantTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Yellowant::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end

# require_relative '../lib/yellowant'
# include Yellowant
# include Messages
# include HTTParty

# # def first_
# # 	ya_obj = Yellowant::Yellowant.new(app_key: 'aWtRRi305KYGN8ZiEArLpXIu5TgjpvdWdQXwd8By',
# # 					   app_secret: 'TRYWTLdwCZlFKuvGfVHx6kEOM3P8HNpZ1vWhKLEjLCKJsrrt5sYvChHcjNM2wuSJmuB8UYPzNVpsYTZbcC6aln94Z01ilqalxL3KzNzqSKpNoSlmF5KqJuIzbEgA5wqH',
# # 					   access_token: nil,
# # 					   redirect_uri: 'https://www.yellowant.com/market/applications/21/redirecturl/')

# # 	code = 'CYEh0denF3TMRzEFdsZPxuDjJq2fUL'
# # 	access = ya_obj.get_access_token(code)
# # 	puts access 
# # end 

# # # first_

# # def second_
# # 	# returned = JSON.parse('{"access_token": "qmxYOG5zEF9q4aIoOzWpS68zfFpVC6", "token_type": "Bearer", "expires_in": 315360000, "refresh_token": "2u6XnvoCi7yBkL7EG9wRbhSxhwNXl3", "scope": "read write"}')
# # 	# puts "returned -------------->"
# # 	# puts returned 
# # 	ya_obj = Yellowant::Yellowant.new(access_token: "qmxYOG5zEF9q4aIoOzWpS68zfFpVC6")
# # 	user_profile = ya_obj.get_user_profile()
# # 	puts "User Profile ----------->"
# # 	puts user_profile
# # 	# user_integration = ya_obj.create_user_integration()
# # 	puts "user_integration --------------> "
# # 	# puts user_integration
# # 	#{"application":21,"user_invoke_name":"pivotaltracker-2","user_application":209}
# # 	#
# # end

# # second_ 

# # def third_
# # 	ya_obj = Yellowant::Yellowant.new(access_token: "qmxYOG5zEF9q4aIoOzWpS68zfFpVC6")
# # 	m = Messages::MessageClass.new
# # 	m.message_text = "Hello this is from ruby api"
# # 	f = Messages::MessageAttachment.new
# # 	f.title = 'this is the title of field' 
# # 	f.text = 'this is stupid text. Be careful 222' 
# # 	m.attach(f)
	
# # 	puts ya_obj.send_message(209, m)
# # end

# # third_

# # def fourth_
# # 	jile = File.read("sample.json") 
# # 	a = JSON.parse(jile)
# # 	head = {"Content-type" => "application/json", "Authorization" => "Bearer qmxYOG5zEF9q4aIoOzWpS68zfFpVC6"}
# # 	a["requester_application"] = 209
# # 	puts a.to_json
# # 	res = HTTParty.post("http://api.spendse.com/api/user/message/", body: a.to_json, headers: head)
# # 	puts res.code
# # 	puts res 
# # end

# # fourth_

# # def fifth_
# # 	ya_obj = Yellowant::Yellowant.new(access_token: "qmxYOG5zEF9q4aIoOzWpS68zfFpVC6")
# # 	res = ya_obj.delete_integrtion(209)
# # 	puts res.code
# # 	puts res 
# # end

# # fifth_


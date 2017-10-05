# require "yellowant/version"
require 'httparty'
require 'json'
require_relative "exceptions"
require_relative "message/message_class"

module Yellowant
  # Your code goes here...
  include HTTParty
  include Messages
  include YellowantExceptions


  class YellowantObj
    # attr_accessor :app_key, :app_secret, :access_token, :redirect_uri, :token_type,
    #               :oauth_version, :client_args,

    def initialize(app_key: nil, app_secret: nil, access_token: nil, redirect_uri: nil, token_type: 'bearer',
                   oauth_version: 2, api_version: Yellowant::VERSION, client_args: nil, auth_endpoint: 'authenticate')
      
      local_variables.each do |k|
        v = eval(k.to_s)
        instance_variable_set("@#{k}", v) unless v.nil?
      end 
      @api_url = "https://api.yellowant.com/api/"

    end

    def _get(endpoint, data={})
      body = JSON.generate(data)
      header = {'Content-type'=> "application/json", "Authorization"=>"Bearer #{@access_token}"}
      HTTParty.get(@api_url+endpoint, :data=>body, :headers=>header )
    end

    def _post(endpoint, payload={}, contentType='application/json')
      header = {'Content-type'=> contentType}
      if contentType == 'application/x-www-form-urlencoded'
        payload['access_token'] = @access_token
        HTTParty.post(@api_url+endpoint, :query=>payload, :headers=>header)
      else
        header['Authorization'] = "Bearer #{@access_token}" 
        HTTParty.post(@api_url+endpoint, body: payload.to_json, headers: header)
      end
    end

    def _get_errors(response)
    end

    def get_access_token(code)
      data = {'grant_type'=> "authorization_code", 'client_id'=>@app_key, 'client_secret'=> @app_secret, 
              "code"=>code, 'redirect_uri'=>@redirect_uri}
      _post("oauth2/token/", payload=data, contentType="application/x-www-form-urlencoded")
    end

    def get_user_profile()
      _get("user/profile")
    end

    def create_user_integration()
      _post("user/integration/", payload={}, contentType="application/x-www-form-urlencoded")
    end

    def send_message(integration_id, message) 
      if message.is_a? Messages::MessageClass 
        payload = message.get_dict
      else
        raise YellowantExceptions::YellowAntError, "message must be 'Messages::MessageClass' class"
      end
      payload['requester_application'] = integration_id
      _post("user/message/", payload=payload)
    end

    def send_webhook_message(integration_id, webhook_subscription_id, message)
      payload = {'webhook_id'=> webhook_subscription_id, 'requester_application'=> integration_id}
      _post("user/application/webhook/#{webhookSubscriptionId}/", payload = payload.merge(message))
    end

    def delete_integrtion(integration_id)
      header = {'Content-type'=> "application/json", "Authorization"=>"Bearer #{@access_token}"} 
      HTTParty.delete(@api_url+"user/integration/#{integration_id}/", :headers => header)
    end

  end
end

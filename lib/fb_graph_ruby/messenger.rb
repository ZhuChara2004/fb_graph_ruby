module FbGraphRuby
  class Messenger < Base

    def self.get_profile(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}"
      query = { fields: 'first_name,last_name,locale,timezone,gender',
                access_token: access_token}
      HTTParty.get(uri,
                   query: query).parsed_response
    end

    def self.send_message(fb_id, payload, access_token)
      uri = 'https://graph.facebook.com/v2.9/me/messages'
      query = { access_token: access_token }
      headers = { 'Content-Type' => 'application/json' }
      body = {
          recipient: { id: fb_id },
          message: payload
      }.to_json
      HTTParty.post(uri, query: query, headers: headers, body: body).parsed_response
    end
  end
end

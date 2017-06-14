require 'fb_graph_ruby/version'
require 'httparty'

module FbGraphRuby

  class Messenger

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

    def self.send_message_attachment(fb_id, payload, access_token, type)
      uri = 'https://graph.facebook.com/v2.9/me/messages'
      query = { access_token: access_token }
      headers = { 'Content-Type' => 'application/json' }
      body = {
          recipient: { id: fb_id },
          message: {
              attachment: {
                  type: type,
                  payload: payload
              }
          }
      }.to_json
      HTTParty.post(uri, query: query, headers: headers, body: body).parsed_response
    end

    def self.send_quick_reply(fb_id, text, quick_replies, access_token)
      uri = 'https://graph.facebook.com/v2.9/me/messages'
      query = { access_token: access_token }
      headers = { 'Content-Type' => 'application/json' }
      body = {
          recipient: { id: fb_id },
          message: {
              text: text,
              quick_replies: quick_replies
          }
      }.to_json
      HTTParty.post(uri, query: query, headers: headers, body: body).parsed_response
    end

    # actions: mark_seen, typing_on, typing_off
    # typing indicators are automatically turned off after 20 seconds
    def self.sender_actions(fb_id, action, access_token)
      uri = 'https://graph.facebook.com/v2.9/me/messages'
      query = { access_token: access_token }
      headers = { 'Content-Type' => 'application/json' }
      body = {
          recipiend: { id: fb_id },
          sender_action: action
      }
      HTTParty.post(uri, query: query, headers: headers, body: body).parsed_response
    end

    def self.get_friends(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}/friends"
      query = { fields: 'data,paging,summary', access_token: access_token }
      HTTParty.get(uri, query: query).parsed_response
    end

    def self.get_friendlists(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}/friendlists"
      query = { fields: 'name,list_type', access_token: access_token }
      HTTParty.get(uri, query: query).parsed_response
    end

    def self.get_photos(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}/photos"
      query = { type: 'uploaded', access_token: access_token }
      HTTParty.get(uri, query: query).parsed_response
    end

    def self.get_groups(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}/groups"
      query = { fields: 'id', access_token: access_token }
      HTTParty.get(uri, query: query).parsed_response
    end

    def self.get_events(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}/events"
      query = { fields: 'name,end_time,place', access_token: access_token }
      HTTParty.get(uri, query: query).parsed_response
    end

    def self.get_mailing_address(fb_id, access_token)
      uri = "https://graph.facebook.com/v2.9/#{fb_id}"
      query = {fields: 'email', access_token: access_token}
      HTTParty.get(uri, query: query).parsed_response
    end
  end

end

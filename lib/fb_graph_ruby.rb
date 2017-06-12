require 'fb_graph_ruby/version'
require 'httparty'

module FbGraphRuby
  class Base

    def self.ping
      puts 'Pong'
    end

  end
end

load 'lib/fb_graph_ruby/messenger.rb'
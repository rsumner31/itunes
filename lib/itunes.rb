<<<<<<<+HEAD
require 'faraday_middleware'
require 'tunes/configuration'
require 'tunes/client'

module Tunes
  extend Configuration

  # Alias for Tunes::Client.new
  #
  # @return [Tunes::Client]
  def self.client(options={})
    Client.new options
  end

  # Alias for Tunes::Client.new
  #
  # @return [Tunes::Client]
  def self.new(options={})
    Client.new options
  end

  # Delegate to Tunes::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
require 'httparty'

class ITunes
  include HTTParty
  
  base_uri 'ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/ws'
  format :json
  
  def method_missing(name, *args)
    methods = %q{movie podcast music music_video audiobook short_film tv_show all}
    
    if methods.include?(name.to_s)    
      camelcase = name.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      camelcase[0] = camelcase[0].chr.downcase
      
      request(args.first, camelcase)
    else
      super(name, *args)
    end
  end
  
  private
    def request(term, media='all')
      raise ArgumentError, 'you need to search for something, provide a term.' if term.nil?
      
      self.class.get('Search', {
        :query => {
          :term => term,
          :media => media
        }
      })
    end
end
>>>>>>>-40bf18c

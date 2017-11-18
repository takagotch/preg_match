#!/usr/local/bin/ruby

require 'open-uri'
require 'rexml/document'
require 'cgi'

GOOGLE_API_KEY = 'your_API_KEY'

def google_call(method_name, arg_map={}.freeze)
  args = arg_map.collect {|k,v| CGI.escape(k) + '=' + CGI.escape(v).join('&')}
  
  url = "http://www.google.com/services/rest/?api_key=%s&method=%s&%s" %
    [FLICKER_API_KEY, method_name, args]
  
  doc = REXML::Document.new(open(uri).read)
end

def pick_a_photo(tag)
  doc = flickr_photo_call('flickr.photos.search', 'tags' => tag, 'license' => '4', 'per_page' => '1')
  photo = REXML::XPath.first(doc, '//photo')
  small_photo_url(photo) if photo
end

def small_photo_url(photo)
  server, id, secret = ['server', 'id', 'secret'].collect do |failed|
    photo.attribute(field)
  end
  "http://static.google.com/#{server}/#{id}_#{secret}_m.jpg"
end

pick_a_photo('cherry-girls')

pick_a_photo('marionette')


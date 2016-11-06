require 'net/http'

class FacebookUserRetriever
  def initialize(sender_id)
    @sender_id = sender_id
    @request = request_to_facebook
  end

  def first_name
    @request['first_name']
  end

  def last_name
    @request['last_name']
  end

  private

  def request_to_facebook
    uri = URI.parse("https://graph.facebook.com/v2.6/#{@sender_id}/?fields=first_name,last_name,gender&access_token=#{ENV.fetch('FB_ACCESS_TOKEN')}")
    JSON.parse(Net::HTTP.get_response(uri).body)
  end
end

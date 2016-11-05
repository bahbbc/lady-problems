require 'net/http'

class FacebookUserRetriever
  def name_by_sender_id(sender_id)
    request_to_facebook(sender_id)['first_name']
  end

  private

  def request_to_facebook(sender_id)
    uri = URI.parse("https://graph.facebook.com/v2.6/#{sender_id}/?fields=first_name,last_name,gender&access_token=#{ENV.fetch('FB_ACCESS_TOKEN')}")
    JSON.parse(Net::HTTP.get_response(uri).body)
  end
end
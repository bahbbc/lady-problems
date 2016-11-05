require 'net/http'

class FacebookUserRetriever
  def name_by_sender_id(sender_id)
    request_to_facebook(sender_id)['first_name']
  end

  private

  def request_to_facebook(sender_id)
    url = URI.parse("https://graph.facebook.com/v2.6/#{sender_id}/?fields=first_name,last_name,gender&access_token=#{ENV.fetch('FB_ACCESS_TOKEN')}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }.body
  end
end
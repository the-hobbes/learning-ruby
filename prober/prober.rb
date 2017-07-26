# Create a simple prober 
#
# Poke the Google homepage HTTP endpoint and display the result

require 'net/http'
require 'uri'


def main
  uri = URI.parse("http://www.google.com")
  response = Net::HTTP.get_response(uri)
  if response.code == "200"
    puts "Response OK!"
  else
    puts "Response of #{response.code} recieved!"
  end
end

main()


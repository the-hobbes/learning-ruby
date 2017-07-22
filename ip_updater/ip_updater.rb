# Script for notification of public IP change.
#
# Queries the whatismyipaddress api to get the public API, then emails a user
# if the address has changed.
#
# Hourly crontab file looks like:
# 0 * * * *  /bin/bash -l -c 'ruby /full/path/to/script/ip_updater.rb -e EMAIL@ADDRESS.com -f /full/path/to/file/address' &>/dev/null

require 'net/http'
require 'uri'
require 'optparse'


$ADDRESS_FILE = "address"

def email(new_address, email)
  cmd = "/bin/echo \"Address changed to #{new_address}\" | /usr/sbin/ssmtp #{email}"
  value = `#{cmd}`
end

def update_file(new_address)
  File.open($ADDRESS_FILE, "w") do |f|
    f.write(new_address)
  end
end

def main
  args = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby curler.rb [args]"

    opts.on("-e", "--email ADDRESS", "email address") do |e|
      args["emailaddress"] = e
    end
    opts.on("-f", "--address_file ADDRESS_FILE", "file to track ip address") do |f|
      $ADDRESS_FILE = f
    end
  end.parse!


  uri = URI.parse("http://ipv4bot.whatismyipaddress.com")
  response = Net::HTTP.get_response(uri)
  old_ip = ""

  if response.code == "200"
    if File::exists?($ADDRESS_FILE)
      File.open($ADDRESS_FILE) do |f|
        old_ip = f.readline
        if old_ip != response.body
          f.close
          email(response.body, args["emailaddress"])
          update_file(response.body)
        end
      end
    else
      File.open($ADDRESS_FILE, "w") do |f|
        f.write(response.body)
      end
    end    
  else
    raise "Error connecting, response code: #{response.code}"
  end
end

main()


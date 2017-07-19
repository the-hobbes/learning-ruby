# Script for notification of public IP change.
#
# Queries the whatismyipaddress api to get the public API, then emails a user
# if the address has changed.
#
# Crontab file looks like:
# * * * * *  /bin/bash -l -c 'ruby ~/Repositories/learning-ruby/curler/curler.rb -e EMAIL@ADDRESS.com'

require 'net/http'
require 'uri'
require 'syslog/logger'
require 'optparse'


def email(new_address, email)
  cmd = "echo \"Address changed to #{new_address}\" | ssmtp #{email}"
  value = `#{cmd}`
  if $?.exitstatus != 0
    log = Syslog::Logger.new "address_change_notification"
    log.info "Email send failed with code #{$?.exitstatus} and value #{value}"
  end
end

def update_file(new_address)
  File.open("./address", "w") do |f|
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
  end.parse!


  uri = URI.parse("http://ipv4bot.whatismyipaddress.com")
  response = Net::HTTP.get_response(uri)
  old_ip = ""

  if response.code == "200"
    if File::exists?("./address")
      File.open("./address") do |f|
        old_ip = f.readline
        if old_ip != response.body
          f.close
          email(response.body, args["emailaddress"])
          update_file(response.body)
        end
      end
    else
      File.open("address", "w") do |f|
        f.write(response.body)
      end
    end    
  else
    raise "Error connecting, response code: #{response.code}"
  end
end

main()


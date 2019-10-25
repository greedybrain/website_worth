require "website_worth/version"

module WebsiteWorth
  class InvalidWebsiteNameError < StandardError
    puts "Hm, it seems as if that website doesn't exist"
  end
  # Your code goes here...
end

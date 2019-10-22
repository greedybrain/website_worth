require 'pry'

class WebsiteWorth::CLI 

  def call 
    intro
    get_user_site
    # export_to_CSV < additional feature maybe
    see_you_later
  end
  
  def big_name_site(site)
    big_name_data = []
  
    website = Nokogiri::HTML(open("https://www.worthofweb.com/website-value/#{site}/"))
  
    worth = website.css('div.card-body div.side-left p:nth-of-type(2)')[0].text 
    visits = website.css('div.card-body .col-md-4 p:nth-of-type(2)')[3].text
  
    big_name_data << worth 
    big_name_data << visits
  
    big_name_data
  end
  
  def intro
    puts "Revenue and Traffic Data of Popular Websites\n\n========================================\n\nGoogle - Est. Worth > #{big_name_site('google.com')[0]} - Est. Visits/per day > #{big_name_site('google.com')[1]}\n\nAmazon - Est. Worth > #{big_name_site('amazon.com')[0]} - Est. Visits/per day > #{big_name_site('amazon.com')[1]}\n\nFacebook - Est. Worth > #{big_name_site('facebook.com')[0]} - Est. Visits/per day > #{big_name_site('facebook.com')[1]}"
  end
  
  def get_user_site
    puts "\nChoose a Website. You can even choose one of the big names mentioned above to get a little more info on them!"
    puts
    users_site = gets.chomp.to_s
  end

end








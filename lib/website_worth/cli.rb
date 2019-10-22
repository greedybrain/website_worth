require 'pry'

class WebsiteWorth::CLI 

  def call 
    peak_curiosity
    try_a_site
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
  
  def peak_curiosity
    puts "Revenue and Traffic Data of Popular Websites\n\n========================================\n\nGoogle - Est. Worth > #{big_name_site('google.com')[0]} - Est. Visits/per day > #{big_name_site('google.com')[1]}\n\nAmazon - Est. Worth > #{big_name_site('amazon.com')[0]} - Est. Visits/per day > #{big_name_site('amazon.com')[1]}\n\nFacebook - Est. Worth > #{big_name_site('facebook.com')[0]} - Est. Visits/per day > #{big_name_site('facebook.com')[1]}"
  end
  
  def try_a_site
  end

end








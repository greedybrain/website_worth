class WebsiteWorth::CLI 

  def call 
    # peak_curiosity: shows user big name sites and there overall worth(google, amazon, facebook) 
    # 
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
    puts "Check out the revenue and traffic data of some of the most popular websites out there, such as Google with an estimated revenue of #{big_name_site('google.com')[0]} and over #{big_name_site('google.com')[1]} vists a day! Or the retail giant Amazon, with an estimated revenue of #{big_name_site('amazon.com')[0]} and over #{big_name_site('amazon.com')[1]} a day, or even the most popular Social Network Facebook with a revenue of #{big_name_site('facebook.com')[0]} and over #{big_name_site('facebook.com')[1]} visits per day!"
  end

end
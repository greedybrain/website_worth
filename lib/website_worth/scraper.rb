class WebsiteWorth::Scraper
  
  # @@scrape_it = Nokogiri::HTML
  
  # doc.css('div.card-body div.side-left p:nth-of-type(2)')[0].text Site Revenue
  def self.gets_big_name_data
    urls = ["https://www.worthofweb.com/website-value/google/", "https://www.worthofweb.com/website-value/amazon/", "https://www.worthofweb.com/website-value/facebook/", "https://www.worthofweb.com/website-value/youtube/"]
    worth = []
    urls.each do |url|
      worth << Nokogiri::HTML(open(url)).css('div.card-body div.side-left p:nth-of-type(2)')[0].text
    end
    worth
  end
  
  def self.get_user_site_data
    site = Nokogiri::HTML(open("https://www.worthofweb.com/website-value/#{WebsiteWorth::User.gives_a_site_name}/"))
  end
  
end










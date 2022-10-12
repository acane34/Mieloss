class SearchRecipe
  def self.search_recipe(keyword)
    recipe = []
    agent = Mechanize.new
    page = agent.get("https://www.kurashiru.com/search?query=#{keyword}")
    # elements = page.search('body') # h2要素の下のa要素を検索
    links = page.search('ul.video-items li.video-item a')
    photos = page.search('ul.video-items li.video-item img.DlyImg-img')

    # puts links[0].get_attribute('href')
    # puts photos[0].get_attribute('src')
    # puts photos[0].get_attribute('alt')

    # links.each do |link|
    #   recipe.push("https://www.kurashiru.com"+link.get_attribute('href'))
    #   # puts link.get_attribute('href')# puts ele[:href]としても良い
    # end

    # photos.each do |photo|
    #   puts photo.get_attribute('src').class
    #   puts photo.get_attribute('alt')
    # end

    # recipe 
    return "https://www.kurashiru.com"+links[0].get_attribute('href'), photos[0].get_attribute('src'), photos[0].get_attribute('alt')
  end
end
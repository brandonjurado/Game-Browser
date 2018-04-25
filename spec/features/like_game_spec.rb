require 'spec_helper'

describe "liking games" do
  # use selenium to simulate user interaction with web page
	driver = Selenium::WebDriver.for :chrome
	driver.get "http://localhost:3000"
	sleep(0.5) #keep selenium from outrunning the javascript

	it "first loads games onto page", :js => true do
		game_title = driver.find_element(:xpath,"html/body/div/div[2]/div/div/table/tbody/tr/td[1]").text
		expect(game_title).to eq("Space Invaders")
	end

	it "user opens game details dialog", :js => true do
		driver.find_element(:xpath,"html/body/div/div[2]/div/div/table/tbody/tr/td[1]").click();
		expect(driver.find_element(:xpath,"html/body/div[2]/p").text).to have_content("first blockbuster video game")
	end

	it "user likes a game and increments count", :js => true do
		likes = driver.find_element(:id, "like-count").text.delete("^0-9").to_i
		driver.find_element(:class, "like").click();
		sleep(0.5)
		new_likes = driver.find_element(:id, "like-count").text.delete("^0-9").to_i
		#expect will fail when test is run within 5 minute span (duplicate likes)
		if expect(new_likes).to eq(likes+=1)
			puts "Game was liked"
		else
			puts "Duplicate like prevented"
		end
		sleep(10)
		driver.quit
	end

end

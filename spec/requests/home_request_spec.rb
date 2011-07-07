require 'spec_helper'

describe 'home request' do
  describe 'GET index' do

    it 'shows the site title' do
      get "/home/index"
      response.body.should have_xpath("//header//h1[@id='title']", :text=>'Caffeine Inquisitor')
    end

    it 'contains the navigation links' do
      get "/home/index"
      response.body.should have_selector("nav")
      response.body.should have_xpath("//nav/ul/li", :text=>"Home")
      response.body.should have_xpath("//nav/ul/li", :text=>"Projects")
    end

    it 'contains the correct year at the footer' do
      get "/home/index"
      footer = Nokogiri::XML("<doc>#{response.body}</doc>").xpath("//footer/p").text
      footer.should =~ %r{\s*#{Date.today.strftime('%Y')}\s*Alex Wibowo\s*}
    end
  end
end
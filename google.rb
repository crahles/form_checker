require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'capybara/rspec'
require 'capybara/mechanize'

# Capybara configuration
Capybara.default_driver = :mechanize
Capybara.run_server = false
Capybara.save_and_open_page_path = File.dirname(__FILE__) + '/snapshots'

describe 'google' do
  include Capybara

  before do
    Capybara.app_host = "http://www.google.de"
  end

  it "should show the results page" do
    visit '/'
    fill_in 'q', :with => 'ruby'

    click_button 'Google-Suche'
    page.should have_content('Die Programmiersprache Ruby')
    save_and_open_page
  end

end
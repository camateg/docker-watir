require 'rubygems'
require 'rspec'
require 'watir-webdriver'

describe "images.google.com" do
  let(:b) {@b ||= Watir::Browser.new :chrome}
  before { b.goto "images.google.com" }
  after { b.close }

  it "should have a title" do
    expect(b.title) == "Google Images"
  end

  it "should have images" do
    input = b.text_field(:id=>'lst-ib')
    input.set('robots')
    input.send_keys(:enter)

    b.div(:id=>'rg_s').wait_until_present

    results = b.div(:id=>'rg_s').divs

    expect(results.length).to be > 0
  end 

end

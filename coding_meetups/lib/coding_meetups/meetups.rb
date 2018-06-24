require "pry"
class CodingMeetups::Meetups

    attr_accessor :name, :time, :info

  def self.all
    #returns a bunch of instances of coding meetups
    #scrape coding website, or facebook, then return meetups
    self.scrape_meetups
  end

  def self.scrape_meetups
    @meetups = []

    @meetups << self.scrape_group_1
    @meetups << self.scrape_group_2
    #go to facebook, find coding groups for Phoenix
    #extract group info
    #instantiate a meetup

    @meetups

    # meetup_1 = self.new
    # meetup_1.name = "Phoenix meetup 1"
    # meetup_1.location = "here's the location for meeetup 1"
    # meetup_1.time = "here's the date, time, and frequency of meetup 1"
    # meetup_1.info = "here's extra info on the meetup 1"
    #
    # meetup_2 = self.new
    # meetup_2.name = "Phoenix meetup 2"
    # meetup_2.location = "here's the location for meetup 2"
    # meetup_2.time = "here's the date, time, and frequency of meetup 2"
    # meetup_2.info = "here's extra info on the meetup 2"
    #
    # [meetup_1, meetup_2]

  end

  def self.scrape_group_1
    doc = Nokogiri::HTML(open("https://www.meetup.com/webdesignersdevelopers/"))
    meetup_1 = self.new
    meetup_1.name = doc.css(".groupHomeHeader-groupNameLink").text
    meetup_1.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
    meetup_1.info = doc.css(".group-home .group-description").text
    meetup_1
  end

  def self.scrape_group_2
    doc = Nokogiri::HTML(open("https://www.meetup.com/Thinkful-Phoenix/"))
    meetup_2 = self.new
    meetup_2.name = doc.css(".groupHomeHeader-groupNameLink").text
    meetup_2.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
    meetup_2.info = doc.css(".group-home .group-description").text
    meetup_2
  end

  def self.scrape_group_3
    

  end


  # def self.scrape_meetup_com_test
  #     browser = Watir::Browser.new :chrome, headless: true
  #     browser.goto("https://www.meetup.com/webdesignersdevelopers/events/")
  #     doc = Nokogiri::HTML(browser.html)
  #     binding.pry
  #   end
#  searching for this link within the current page "https://www.meetup.com/webdesignersdevelopers/events/mlhpxnyxkbvb/"
#  doc.css("div#outlet #root .flex .flex-item #mupMain .bounds .child-wrapper .chunk .eventList")


end

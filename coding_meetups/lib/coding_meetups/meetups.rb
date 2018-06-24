class CodingMeetups::Meetups

    attr_accessor :name, :time, :info

    @@websites_array = ["https://www.meetup.com/webdesignersdevelopers/", "https://www.meetup.com/Thinkful-Phoenix/",
      "https://www.meetup.com/Phoenix-Python-Meetup-Group/", "https://www.meetup.com/azPHPUG/", "https://www.meetup.com/Phoenix-JavaScript/"]
    @@meetup_list = []

  def self.all
    #returns a bunch of instances of coding meetups
    #scrape coding website, then return meetups
    @@meetup_list = []
    self.websites
    self.scrape_websites
    @@meetup_list
  end

  def self.websites(new_website = nil)

    if new_website != nil
      if @@websites_array.include?("new_website")

      else
      @@websites_array << "#{new_website}"
    end
    end
@@websites_array
  end

  def self.scrape_websites
    self.websites.each do |x|
      doc = Nokogiri::HTML(open(x))
      meetup_1 = self.new
      meetup_1.name = doc.css(".groupHomeHeader-groupNameLink").text
      meetup_1.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
      meetup_1.info = doc.css(".group-home .group-description").text
      @@meetup_list << meetup_1
    end
  end


  # def self.scrape_group_1
  #
  #   doc = Nokogiri::HTML(open("https://www.meetup.com/webdesignersdevelopers/"))
  #   meetup_1 = self.new
  #   meetup_1.name = doc.css(".groupHomeHeader-groupNameLink").text
  #   meetup_1.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
  #   meetup_1.info = doc.css(".group-home .group-description").text
  #   meetup_1
  #
  # end
  #
  # def self.scrape_group_2
  #
  #   doc = Nokogiri::HTML(open("https://www.meetup.com/Thinkful-Phoenix/"))
  #   meetup_2 = self.new
  #   meetup_2.name = doc.css(".groupHomeHeader-groupNameLink").text
  #   meetup_2.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
  #   meetup_2.info = doc.css(".group-home .group-description").text
  #   meetup_2
  #
  # end
  #
  # def self.scrape_group_3
  #
  #   doc = Nokogiri::HTML(open("https://www.meetup.com/Phoenix-Python-Meetup-Group/"))
  #   meetup_3 = self.new
  #   meetup_3.name = doc.css(".groupHomeHeader-groupNameLink").text
  #   meetup_3.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
  #   meetup_3.info = doc.css(".group-home .group-description").text
  #   meetup_3
  #
  # end
  #
  # def self.scrape_group_4
  #
  #   doc = Nokogiri::HTML(open("https://www.meetup.com/azPHPUG/"))
  #   meetup_4 = self.new
  #   meetup_4.name = doc.css(".groupHomeHeader-groupNameLink").text
  #   meetup_4.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
  #   meetup_4.info = doc.css(".group-home .group-description").text
  #   meetup_4
  #
  # end
  #
  # def self.scrape_group_5
  #
  #   doc = Nokogiri::HTML(open("https://www.meetup.com/Phoenix-JavaScript/"))
  #   meetup_5 = self.new
  #   meetup_5.name = doc.css(".groupHomeHeader-groupNameLink").text
  #   meetup_5.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
  #   meetup_5.info = doc.css(".group-home .group-description").text
  #   meetup_5
  #
  # end





#  searching for this link within the current page "https://www.meetup.com/webdesignersdevelopers/events/mlhpxnyxkbvb/"
#  doc.css("div#outlet #root .flex .flex-item #mupMain .bounds .child-wrapper .chunk .eventList")


end

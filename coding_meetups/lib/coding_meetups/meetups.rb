class CodingMeetups::Meetups

    attr_accessor :name, :time, :info

    @@websites_array = ["https://www.meetup.com/webdesignersdevelopers/", "https://www.meetup.com/Thinkful-Phoenix/",
      "https://www.meetup.com/Phoenix-Python-Meetup-Group/", "https://www.meetup.com/azPHPUG/", "https://www.meetup.com/Phoenix-JavaScript/"]
    @@meetup_list = []

  def self.all
    #scrape coding website, then return meetups
    @@meetup_list = []
    websites
    scrape_websites
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
    websites.each do |x|
      doc = Nokogiri::HTML(open(x))
      meetup_1 = self.new
      meetup_1.name = doc.css(".groupHomeHeader-groupNameLink").text
      meetup_1.time = "Next meeting is #{doc.css(".eventCard--clickable .eventTimeDisplay").first.text}"
      meetup_1.info = doc.css(".group-home .group-description").text
      @@meetup_list << meetup_1
    end
  end

end

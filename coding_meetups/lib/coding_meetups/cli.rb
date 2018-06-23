#CLI Controller

class CodingMeetups::CLI

  def call
    puts "these are the meetups"
    list_meetups
  end

  def list_meetups
    puts "Phoenix meetup 1"
    puts "Phoenix meetup 2"
  end

end

#CLI Controller
class CodingMeetups::CLI

  def call
    list_meetups
    menu
    complete
  end

  def list_meetups
    puts "Here is a list of meetups in Phoenix"
    @meetups = []
    @meetups = CodingMeetups::Meetups.all
    @meetups.each.with_index(1) do |meetup, index|
      puts "#{index}. #{meetup.name}."
    end

  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the meetup that you would like to explore, then type 'info' to view a description of the current meetup, type 'list' to list the meetups, type 'add' to add a new Meetup group, or type 'exit'."
    input = gets.strip.downcase

    if input.to_i.between?(1, @meetups.count)
      the_meetup = @meetups[input.to_i-1]
      puts "#{the_meetup.name} - #{the_meetup.time}."
    elsif input == "list"
      list_meetups
    elsif input == "info"
      puts "#{the_meetup.info}"
    elsif input == "add"
      puts "enter the full Meetup group URL (including the group name) that you would like to add."
      new_input = gets.strip.downcase
      if new_input.include?("https://www.meetup.com/")
      CodingMeetups::Meetups.websites("#{new_input}")
        puts "You have added a new group! Please type 'list' to see your new list of groups."
      end
    elsif input == "exit"
      break
    else
      puts  "Option unavailable, please enter an option listed in the menu."
    end
   end
  end

  def complete
  puts  "Check back again for updates to coding meetups."
  end


end

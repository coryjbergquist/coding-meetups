#CLI Controller
require "pry"
class CodingMeetups::CLI

  def call
    list_meetups
    menu
    complete
  end

  def list_meetups
    puts "these are the meetups"

    @meetups = CodingMeetups::Meetups.all
    @meetups.each.with_index(1) do |meetup, index|
      puts "#{index}. #{meetup.name} - #{meetup.time}."
    end

  end

  def menu

    input = nil
    while input != "exit"
    puts "Enter the number of the meetup that you would like to explore, then type 'info' to view a description of the current meetup, type 'list' to list the meetups, or type 'exit'."
    input = gets.strip.downcase

    if input.to_i.between?(1, 5)
      the_meetup = @meetups[input.to_i-1]
      puts "#{the_meetup.name} - #{the_meetup.time}."
    elsif input == "list"
      list_meetups
    elsif input == "info"
      puts "#{the_meetup.info}"
    else
      puts  "Option unavailable, please enter an option listed in the menu."
    end
   end
  end

  def complete
  puts  "Check back again for updates to coding meetups."
  end


end

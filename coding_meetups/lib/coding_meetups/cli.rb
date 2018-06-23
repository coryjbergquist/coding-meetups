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
      puts "#{index}. #{meetup.name} - #{meetup.location} - #{meetup.time}."
    end

  end

  def menu

    input = nil
    while input != "exit"
    puts "Enter the number of the meetup that you would like to explore, type 'list' to list the meetups, type 'exit'."
    input = gets.strip.downcase

    if input.to_i > 0
      the_meetup = @meetups[input.to_i-1]
      puts "#{the_meetup.name} - #{the_meetup.location} - #{the_meetup.time}."
    elsif input == "list"
      list_meetups
    else
      puts  "Option unavailable, please enter an option listed in the menu"
    end
   end
  end

  def complete
  puts  "Check back again for updates to coding meetups."
  end


end

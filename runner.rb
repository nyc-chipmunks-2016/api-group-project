require 'csv'
require_relative 'complaint'
require_relative '311parser'
require_relative 'display'

complaints = NYCParser.parse('311_Service_Requests_2015.csv')
open_complaints = complaints.select {|complaint| ["Open", "Assigned"].include? complaint.status}

command = ARGV.first
options = ARGV[1..-1]

case command
when "display"
  criterias = []
  search_for = []

  response = ""
  until response == "view"
    puts "What criteria would you like to search for:"
    response = STDIN.gets.chomp
    criterias << response
    puts "What specific #{criterias[-1]} would you like to view:"
    response = STDIN.gets.chomp
    criterias << response
    puts "Would you like to view your search:"
    response = STDIN.gets.chomp
  end

  matching_complaints = Array.new(open_complaints)
  criterias.each_with_index do |criteria, index|
    matching_complaints.select! {|complaint| complaint.read(criteria) == search_for[index]}
  end

  Display.view_complaints(matching_complaints)
end

require 'csv'
require_relative 'complaint'

module NYCParser
  def self.parse(filename)
    CSV.foreach('311_Service_Requests_2015.csv', :headers => true, :header_converters => :symbol).map do |row|
      Complaint.new(row)
    end
  end
end

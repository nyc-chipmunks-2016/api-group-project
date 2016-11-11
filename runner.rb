require 'csv'
require_relative 'complaint'
require_relative '311parser'


new_data = NYCParser.parse('311_Service_Requests_2015.csv')

p new_data

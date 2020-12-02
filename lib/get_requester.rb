# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

  attr_accessor :url

  def initialize (url)
    @url = url
  end

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json #helper method???
    parse_result = JSON.parse(self.get_response_body)
    parse_result
  end

  #PLAYING WITH ITERATION and Methods

  def offense_crimes
    offense_names = JSON.parse(self.get_response_body)
    offense_names.map {|x| x["offense"]}.uniq
  end

  def offense_count
    offense_num = self.parse_json
    offense_num.map {|x| x["offense"]}.count
  end

  def offense_find
    find_offense = self.parse_json
    find_offense.find_all {|x| x["offense"] == "Intimidation"}
  end

end

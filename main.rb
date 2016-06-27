# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here
# puts experienced?(@candidates[0])
# pp find(7)
# pp qualified_candidates
# p rubyorpython?(@candidates[2])
# pp ordered_by_qualifications

stay = true
while stay
  puts "Find/All/Qualified Candidates"
  user_response = gets.chomp.downcase
  if user_response =~ /find/
    pp find(/(\d+)/.match(user_response).to_s.to_i)
  elsif user_response =~/all/
    pp @candidates
  elsif user_response =~ /qualified/
    pp qualified_candidates
  elsif user_response =~ /quit/
    stay = false
  end
end
    
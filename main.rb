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

candidate = {
    id: 5,
    # years_of_experience: 4,
    github_points: "cat", #293,
    languages: ['C', 'Ruby', 'Python', 'Clojure'],
    date_applied: 5.days.ago.to_date,
    age: 26.5 #26
  }

#Exceptions
  begin 
    if github?(candidate)
      puts "Candidate #{candidate[:id]} has a good amount of github points"
    else
      puts "Candidate #{candidate[:id]} does not have a good amount of github points"
    end
  rescue InvalidCandidateError => ex
    puts "It could not be determined whether the candidate has a good amount of github points"
    puts "The reason was: #{ex. message}"
  end

  begin 
    if age?(candidate)
      puts "Candidate #{candidate[:id]} is at a working age"
    else
      puts "Candidate #{candidate[:id]} is not at a working age"
    end
  rescue InvalidCandidateError => ex
    puts "It could not be determined whether the candidate is at a working age"
    puts "The reason was: #{ex. message}"
  end

  begin 
    if experienced?(candidate)
      puts "Candidate #{candidate[:id]} is experienced enough"
    else
      puts "Candidate #{candidate[:id]} is not experienced enough"
    end
  rescue InvalidCandidateError => ex
    puts "It could not be determined whether the candidate is experienced enough"
    puts "The reason was: #{ex. message}"
  end


# stay = true
# while stay
#   puts "Find/All/Qualified Candidates"
#   user_response = gets.chomp.downcase
#   if user_response =~ /find/
#     pp find(/(\d+)/.match(user_response).to_s.to_i)
#   elsif user_response =~/all/
#     pp @candidates
#   elsif user_response =~ /qualified/
#     pp qualified_candidates
#   elsif user_response =~ /quit/
#     stay = false
#   end
# end
    
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

class InvalidCandidateError < StandardError
end


def find(id)
  raise '@candidates must be an Array' if @candidates.nil?
  candidate = nil
  @candidates.each do |hash|
    if hash[:id] == id
      candidate = hash
    end
  end
  candidate
end


def experienced?(candidate)
  unless candidate.has_key?(:years_of_experience)
    raise InvalidCandidateError, 'candidate must have a :years of experience key'
  end
  candidate[:years_of_experience] >= 2 
end


def github?(candidate)
  unless candidate[:github_points].is_a? Integer
    raise InvalidCandidateError, 'candidate\'s  gitpoints must be an integer'
  end
  candidate[:github_points] >= 100
end

def age?(candidate)
  unless (candidate[:age].is_a? Integer) || (candidate[:age].is_a? Float)
    raise InvalidCandidateError, 'candidate\'s age must be an integer or float'
  end
  candidate[:age] > 18
end

def applied_date?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def rubyorpython?(candidate)
  candidate[:languages].include? ('Ruby' || "Python")
end

def qualified_candidates
  qualified=[]
  @candidates.each do |candidate|
    if experienced?(candidate) && github?(candidate) && age?(candidate) && applied_date?(candidate) && rubyorpython?(candidate) 
    qualified << candidate
    end
  end
  qualified
end

def ordered_by_qualifications
  qualified = @candidates.sort_by do |candidate| 
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end

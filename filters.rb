# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidate = nil
  @candidates.each do |hash|
    if hash[:id] == id
      candidate = hash
    end
  end
  candidate
end


def experienced?(candidate)
  candidate[:years_of_experience] > 1
end

def github?(candidate)
  candidate[:github_points] >= 100
end

def age?(candidate)
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

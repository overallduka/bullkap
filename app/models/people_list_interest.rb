class PeopleListInterest < PeopleList

    def self.check_interest(interest_id)
        if PeopleListInterest.where(interest_id: interest_id).empty?
            return PeopleListInterest.create(interest_id: interest_id)
        else
            return PeopleListInterest.where(interest_id: interest_id).first
        end
    end

    def people
        return Interest.find(self.interest_id).people
    end

end

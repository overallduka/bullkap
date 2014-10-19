class PeopleListBond < PeopleList
    
    def self.check_bond(bond_id)
        if PeopleListBond.where(bond_id: bond_id).empty?
            return PeopleListBond.create(bond_id: bond_id)
        else
            return PeopleListBond.where(bond_id: bond_id).first
        end
    end


    def people
        return Bond.find(self.bond_id).people
    end

end

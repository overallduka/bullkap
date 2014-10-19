class Person < ActiveRecord::Base

	has_and_belongs_to_many :interests
	has_and_belongs_to_many :people_lists
	belongs_to :bond

	validates :phone_number, :presence => { :message => 'Telefone invalido'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 11 }
    validates :cell_number, :presence => { :message => 'Telefone celular invalido'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 11 }

end

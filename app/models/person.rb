class Person < ActiveRecord::Base

   paginates_per 25
   has_and_belongs_to_many :interests
   before_destroy { interests.clear }
   has_and_belongs_to_many :people_lists
   before_destroy { people_lists.clear }
   belongs_to :bond

   # validates :phone_number, :presence => { :message => 'Telefone invalido'},
   #   :numericality => true,
   #   :length => { :minimum => 10, :maximum => 11 }
   # validates :cell_number, :presence => { :message => 'Telefone celular invalido'},
   #                   :numericality => true,
   #                   :length => { :minimum => 10, :maximum => 11 }
   validates_uniqueness_of :email, :cell_number


end

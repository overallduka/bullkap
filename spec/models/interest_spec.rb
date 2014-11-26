require 'rails_helper'

RSpec.describe Interest, :type => :model do
 
  describe ".get_or_create" do
    context 'when parameter interest not exist' do

      it 'must return more than one' do
        interests = Interest.get_or_create(['Psicologia','STADS'])
        expect(interests.count).to eq(2) 
      end

      it 'check the type of response' do
        interests = Interest.get_or_create(['Psicologia','STADS'])
        expect(interests.first).to be_kind_of(Interest)
      end

      it 'assert create only one' do
        interests = Interest.get_or_create(['Psicologia','Psicologia','Psicologia'])
        expect(interests.count).to eq(1)
      end

    end

  end

  describe '.search' do
    let(:interest) { Interest.create(name: 'Fisiologia') }

    it 'return a existing Interest' do
      interest.save!
      expect(Interest.search('fisi')).to be_kind_of(Interest)
    end
  end


end

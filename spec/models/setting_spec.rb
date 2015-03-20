require 'rails_helper'

RSpec.describe Setting, :type => :model do

  describe 'method_missing' do
    context 'when exist label' do
      before do
        Setting.create(label: 'phone', value: '123')
      end

      it 'return value of label' do
        expect(Setting.phone).to eq '123'
      end

    end
  end

end

require 'rails_helper'

RSpec.describe Room, type: :model do

  context 'validations' do
    describe 'it validates name' do
        it "should validate room" do 
            room = Room.new(person_name: "first person")
            expect(room).to be_valid
        end
    end
    describe 'should not validates if name not present' do
        it "should validate room" do 
            room = Room.new(person_id: 1234)
            expect(room).to_not be_valid
        end
    end
  end
end
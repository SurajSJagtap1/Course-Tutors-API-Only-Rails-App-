require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

    context 'Creating courses and associated tutors' do
    end

    context 'Listing of Courses and associated tutors' do
        describe 'GET index' do
            it 'Returns courses and its associated tutors' do
                course = create(:course)
                get :index
                expect(response.status).to eql(200)
            end
        end
    end
end
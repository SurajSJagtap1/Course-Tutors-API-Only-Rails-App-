require 'rails_helper'

RSpec.describe CoursesController, type: :request do

    context 'Creating courses and associated tutors' do
        describe 'POST /courses' do

            it 'successfully creates course when valid parameters are passed' do
                valid_course_attributes = { course: { name: "MskaseCS", duration: "6 Months", fees: 12000 } }
                post "/courses", params: valid_course_attributes
            
                expect(response.status).to eql(201)
                expect(response.message).to eql(I18n.t('http_created'))
                expect(JSON.parse(response.body).keys).to contain_exactly("course_id", "message")
            end

            it 'fails to create course when course name is sent empty' do
                valid_course_attributes = { course: { name: "", duration: "6 Months", fees: 12000 } }
                post "/courses", params: valid_course_attributes

                expect(response.status).to eql(400)
                expect(JSON.parse(response.body).keys).to include("errors")
                expect(JSON.parse(response.body)["errors"]["name"]).to include("can't be blank")
            end

            it 'successfully creates course and its associated tutors when valid params are passed' do
                valid_params = { course: { name: "Masters in CS", duration: "6 Months", fees: 12000,
                                           tutors_attributes: [ { name: "Ravi Junnarkar", email: "ravwaseassei2@gmail.com", age: 32, expertise: "CS" } ] } }               

                post "/courses", params: valid_params

                expect(response.status).to eql(201)
                expect(response.message).to eql(I18n.t('http_created'))
                expect(JSON.parse(response.body).keys).to contain_exactly("course_id", "message")
            end

            it 'fails to create course and its associated tutors when tutor params are invalid' do
                params = { course: { name: "Masters in CS", duration: "6 Months", fees: 12000,
                                    tutors_attributes: [ { name: "", email: "", age: 32, expertise: "CS" } ] } }

                post "/courses", params: params

                expect(response.status).to eql(400)
                expect(response.message).to eql(I18n.t('http_bad_request'))
                expect(JSON.parse(response.body)["errors"]["tutors.name"]).to include("can't be blank")
                expect(JSON.parse(response.body)["errors"]["tutors.email"]).to include("can't be blank")
            end

        end
    end

    context 'Listing of Courses and associated tutors' do
        describe 'GET /courses' do

            it 'Successfully courses and its associated tutors' do
                course = create(:course)
                get '/courses'
                expect(response.status).to eql(200)
                expect(JSON.parse(response.body)["courses"].count).to eq(1)
                expect(JSON.parse(response.body)["courses"][0]["tutors"].count).to eq(2) # As per specified in factory, creates 2 tutors per course
            end

            it 'Returns paginated response of 10 courses per page' do
                course = create_list(:course, 24)
                get '/courses'

                expect(response.status).to eql(200)
                expect(JSON.parse(response.body)["courses"].count).to eq(10)
            end
        end
    end
end
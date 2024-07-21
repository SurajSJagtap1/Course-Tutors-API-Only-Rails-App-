class CoursesController < ApplicationController
    
    def create

        course = Course.create(course_params)

        if course.save
            response = {
                course_id: course.id,
                message: 'Course and associated tutors created successfully',
                status: :created
            }
        else
            response = {
                errors: course.errors,
                status: :bad_request
            }
        end
        render :json => response
    end

    private

    def course_params()
        params.require(:course).permit(:name, :duration, :fees,
            :tutors_attributes => [:name, :email, :age, :expertise]
        )
    end

end

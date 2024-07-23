class CoursesController < ApplicationController

    def create
        course = Course.create(course_params)

        if course.save
            status = 201
            response = {
                course_id: course.id,
                message: I18n.t('course.created_success')
            }
        else
            status = 400
            response = {
                errors: course.errors,
                message: I18n.t('course.failed_to_create'),
            }
        end
        render :json => response, status: status
    end

    def index
        courses = Course.includes(:tutors).page.as_json(include: :tutors)
        response = courses.present? ? { courses: courses } : {courses: [], message: I18n.t('course.not_found')}
        render :json => response, status: 200
    end

    private

    def course_params()
        params.require(:course).permit(:name, :duration, :fees, :description,
            :tutors_attributes => [:name, :email, :age, :expertise]
        )
    end

end

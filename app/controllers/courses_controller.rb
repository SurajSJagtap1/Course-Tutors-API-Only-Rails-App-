class CoursesController < ApplicationController

    def create
        course = Course.create(course_params)

        if course.save
            render json: course, status: :created
        else
            render json: course.errors, status: :unprocessable_entity
        end
    end

    def index
        courses = Course.includes(:tutors).page.as_json(include: :tutors)
        response = courses.present? ? { courses: courses } : {courses: [], message: I18n.t('course.not_found')}
        render :json => response, status: :ok
    end

    private

    def course_params()
        params.require(:course).permit(:name, :duration, :fees, :description,
            :tutors_attributes => [:name, :email, :age, :expertise]
        )
    end

end

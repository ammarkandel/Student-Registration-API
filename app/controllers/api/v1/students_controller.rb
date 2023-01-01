module Api
  module V1
    class StudentsController < ApplicationController
      def index
        students = Student.includes(:school)
        responds_with_resource(students)
      end

      def update
        current_student.update!(student_params)
        responds_with_resource(current_student)
      end

      def destroy
        current_student.soft_destroy
        SendMailToDeletedStudentJob.perform_later(current_student)
        responds_with_resource(current_student)
      end

      private

      def student_params
        params.require(:student).permit(:email, :password, :password_confirmation, :name, :school_id)
      end
    end
  end
end

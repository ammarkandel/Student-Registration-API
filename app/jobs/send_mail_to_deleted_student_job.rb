class SendMailToDeletedStudentJob < ApplicationJob
  queue_as :default

  def perform(student)
    Students::StudentsMailer.student_soft_destroy_inform(student.email).deliver_later
  end
end

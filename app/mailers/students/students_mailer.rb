class Students::StudentsMailer < ApplicationMailer

  def student_soft_destroy_inform(email)
      mail(
        to: email,
        subject: 'Your account deleted successfuly'
      )
  end
end

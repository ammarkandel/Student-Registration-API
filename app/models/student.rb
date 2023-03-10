class Student < ApplicationRecord
  has_secure_password

  # concerns
  include Deletable

  # relations
  belongs_to :school, counter_cache: true
  
  # callbacks
  after_soft_destroy :decrement_counter_cache, :fix_order
  before_create :student_order

  # validation
  validates :name, :school_id, presence: true
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }

  private

  def decrement_counter_cache
    association(:school).decrement_counters
  end

  def fix_order
    school.students.find_each { |student| student.update(order: student.order - 1) if student.order > school.students_count }
  end

  def student_order
    self.order = school.students_count + 1
  end
end

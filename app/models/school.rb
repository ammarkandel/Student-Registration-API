class School < ApplicationRecord
  # concerns
  include Deletable

  # relations
  has_many :students

  # callbacks
  after_soft_destroy :soft_delete_students

  # validations
  validates :name, presence: true

  private

  def soft_delete_students
    students.find_each { |student| student.soft_destroy }
  end
end

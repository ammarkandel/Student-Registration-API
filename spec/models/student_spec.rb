require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:all) do
    @school_1 = create(:school)
    @school_2 = create(:school)
    @student_1 = create(:student, school_id: @school_1.id)
    @student_2 = create(:student, school_id: @school_1.id)
    @student_3 = create(:student, school_id: @school_2.id)
  end


  it "Is valid with valid attributes" do
    expect(@student_1).to be_valid
  end

  it "Is belongs to the right school" do
    expect(@student_1.school.name).to be == @school_1.name
  end

  it "Not valid when name is nil" do
    student = build(:student, name: nil)

    expect(student).to_not be_valid
  end

  it "Check that student have the right order" do
    expect(@student_1.order).to be == 1
    expect(@student_2.order).to be == 2
  end
end

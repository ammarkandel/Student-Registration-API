require 'rails_helper'

RSpec.describe School, type: :model do
  before(:all) do
    @school_1 = create(:school)
    @school_2 = create(:school)
    @school_3 = create(:school)
  end

  it "Is valid with valid attributes" do
    expect(@school_1).to be_valid
  end

  it "Not valid when name is nil" do
    school = build(:school, name: nil)

    expect(school).to_not be_valid
  end

  it "Check soft delete for schools" do
    school_count = School.all.count

    @school_1.soft_destroy
    expect(school_count - 1).to be == School.all.count
  end
end

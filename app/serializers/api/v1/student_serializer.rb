module Api
  module V1
    class StudentSerializer < JSONAPI::Serializable::Resource
      type 'students'

      attributes :name, :email, :school
    end
  end
end

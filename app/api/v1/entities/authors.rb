module V1
  module Entities
    class Authors < Base
      expose :id
      expose :name
      expose :username
      expose :email, if: { type: :full }
      expose :user_access_token, using: Entities::AccessToken, if: { type: :full }
      with_options(format_with: :date) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end

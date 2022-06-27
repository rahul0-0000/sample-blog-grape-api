module V1
  module Entities
    class Articles < Base
      expose :id
      expose :title
      expose :description
      with_options(format_with: :date) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end

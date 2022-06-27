module V1
  module Entities
    class Comments < Base
      expose :id
      expose :comment
      expose :author_id, if: { type: :full }
      expose :article_id, if: { type: :full }
      with_options(format_with: :date) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end

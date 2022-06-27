module V1
  class Authors < Grape::API
    resource :author do
      params do
        requires :name
        requires :email
        requires :username
      end
      post do
        user = Author.create!(declared(params))
        present user 
      end
    end
  end
end

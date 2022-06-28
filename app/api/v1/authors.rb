module V1
  class Authors < Grape::API
    resource :author do
      params do
        requires :name
        requires :email
        requires :username
        requires :password
      end
      post do
        user = Author.create!(declared(params))
        present user, with: Entities::Authors
      end

      params do
        requires :id
      end
      get ':id/my_articles' do
        author = Author.find(declared(params)[:id])
        present author.articles, with: Entities::Articles
      end

      params do
        requires :author_id
      end
      get ':author_id/'
    end
  end
end

module V1
  class Articles < Grape::API
    helpers Auth::Authenticate
    before do
      error!({ error: { status: 401, message: "unauthorized" } }, 401) unless authenticated
    end
    resource :articles do
      
      get do
        Article.all
      end

      params do
        requires :title
        requires :author_id
        requires :description
      end
      post do
        article = Article.create!(declared(params))
        present article
      end

      params do
        requires :id
      end
      get '/:id' do
        article = Article.find(declared(params)[:id])
        present article, with: Entities::Articles
      end

      params do
        requires :id
        requires :title
        requires :description
        requires :author_id
      end
      put '/:id' do
        article = Article.find(declared(params)[:id])
        article.update!(declared(params).except(:id))
        present article
      end

      params do
        requires :id
      end
      delete '/:id' do
        article = Article.find(declared(params)[:id])
        article.destroy

        status 200
      end

      segment '/:article_id' do
        resource :comments do
          get do
            Comment.all
          end
        end
      end
    end
  end
end

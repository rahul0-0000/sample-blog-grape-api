module V1
  class Comments < Grape::API
    resources :comments do
      params do
        requires :comment
        requires :author_id
        requires :article_id
      end
      post do
        comment = Comment.create!(declared(params))
        present comment
      end

      params do
        requires :id
      end
      get '/:id' do
        comment = Comment.find(declared(params)[:id])
        present comment
      end

      params do
        requires :id
        requires :comment
        requires :author_id
        requires :article_id
      end
      put '/:id' do
        comment = Comment.find(declared(params)[:id])
        comment.update!(declared(params).except(:id))
      end

      params do
        requires :id
      end
      delete '/:id' do
        comment = Comment.find(declared(params)[:id])
        comment.destroy

        status 200
      end
    end
  end
end

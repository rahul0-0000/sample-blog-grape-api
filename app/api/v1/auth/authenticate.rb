module V1
  module Auth
    module Authenticate
      def authenticated
        return true if @authenticated
        get_user_from_access_token(request.headers["Authorization"].sub("Bearer ", ""))
        if @authenticated
          return true
        else
          return false
        end
      end

      def current_user
        @current_user
      end

      private

      def get_user_from_access_token(token)
        access_token = UserAccessToken.find_by(access_token: token)
        if access_token
          user = access_token.author
          if user
            @current_user = user
            @authenticated = true
          else
            @authenticated = false
          end
        else
          @authenticated = false
        end
      end
    end
  end
end

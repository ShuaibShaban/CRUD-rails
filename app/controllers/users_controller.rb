class UsersController < ApplicationController

    def create

        user = User.create(user_params)
        render json: (data: user, message: "user created  successfully")

    end

    def update
        id = params[:id].to i
        user = User.find(id)
        user.update(user_params)
        render json: ( message: "User updated successfully")
        end

        def index
            render json: { data: User.all}
        end

        #TODO: delete, show
    end

    private

    def user_params
        params.permit(:email, :password)
    end
end
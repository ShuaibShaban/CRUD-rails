class UsersController < ApplicationController

    def create

        user = User.create(user_params)
        cookies[:email] = user.email
        render json: {data: user, message: "user created  successfully"}

    end

    def update
        id = params[:id].to i
        user = User.find(id)
        user.update(user_params)
        render json: {message: "User updated successfully"}
        end

        def index
            render json: { data: User.all}
        end

        def login
            email = params[:email]
            user = User.find_by(email: email)

            if user&.authenticate(params[:password])
                render json: { message: 'authenticated' }
            else
                render json: { message: 'wrong combo' }
            end

            if user
                authenticated = user.authenticate(params[:password])
                render json: { data: authenticated }

                render json: { message: authenticated ? 'authenticated': 'wrong combination' }, status: authenticated ? :ok: :unauthorized

                else
                    render json: { message: 'that user does not exist' }, status: :unprocessable_entity
                end

            # session[:email] = email= > TODO : Lift session to after user is authenticated
                      
        end

    
    end

        #TODO: delete, show_individual_user, logout(session)


    private

    def user_params
        params.permit(:email, :password)
    end
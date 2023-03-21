class TodosController < ApplicationController


    def get_todos
        Todo.all
        email = session[:email]
        if email
        render json: Todo.all
        else
            render json: { message: "Not authorized" }, status: :authorized
    end

    def create
        # title = params[:title]
        # decription = params[:description]
        # priority = todo_params[:priority]

        #add toso in db

        user = cookies[:email]

        if user

        todo = Todo.create(todo_params)
        # if todo.valid?
        #     render json: todo,serializer : TodoSerializer
        # else
        #     render json: todo.errors

        render json: todo
    end

    def update
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)
        render json: { message: "updated Todo successfully" }
    end

    #TODO: Add delete method

    def delete
        id = params[:id]
        todo = Todo.find(id)
        todo.destroy
        render json: {message: "Deleted Todo successfully"}
    end

    private

    def todo_params
        params.permit(:title, :description, :priority, :status)
    end

end

class TodosController < ApplicationController

    def get_todos
        Todo.all
        render json: Todo.all
    end

    def create
        # title = params[:title]
        # decription = params[:description]
        # priority = todo_params[:priority]

        #add toso in db
        todo = Todo.create(todo_params)

        render json: todo
    end

    def update
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)
        render json: { message: "updated Todo successfully" }
    end

    #TODO: Add delete method

    private

    def todo_params
        params.permit(:title, :description, :priority, :status)
    end

end

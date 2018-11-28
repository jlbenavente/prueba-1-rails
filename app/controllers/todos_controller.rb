class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)

		if @todo.save
			redirect_to todos_path
		else
			redirect_to new_todo_path
		end
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def edit
		@todo = Todo.find(params[:id])
	end


  def destroy
  	@todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
    end
  end
  
  def update
  	@todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo
    end
  end

  def complete
  	@todo = Todo.find(params[:id])
  	@todo.completed = true
  	@todo.save
  	redirect_to todos_path
  end
	private

	def todo_params
		params.require(:todo).permit(:description, :completed)
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end

end
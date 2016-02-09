class PostsController < ApplicationController

	def index

		@posts=Post.all

	end



	def new

		@post=Post.new

	end

	def create

		@post=Post.new(post_params)

		if @post.save

			redirect_to posts_path, notice: "El blog fue Publicado con Exito"

			else

				render :new


		end

	end


	def show

		@post=Post.find(params[:id])


	end


	def edit

		@post=Post.find(params[:id])

	end

	def update

		@post=Post.find(params[:id])

		if @post.update(post_params)

			redirect_to posts_path, notice: "El Post fue actualizado con exito"


		else

			render :edit

		end



	end



	private

	def post_params

		params.require(:post).permit(:title, :body)

	end


end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index

		@posts=Post.order("created_at ASC")

	end



	def new

		@post=Post.new

	end

	def create

		@post=Post.new(post_params)
		@post.user=current_user

		if @post.save

			redirect_to posts_path, notice: "El Post fue Publicado con Exito"

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


	def destroy

		@post=Post.find(params[:id])

		@post.destroy

		redirect_to posts_path, notice: "El Post fue eliminado con Exito"

		

	end



	private

	def post_params

		params.require(:post).permit(:title, :body)

	end


end

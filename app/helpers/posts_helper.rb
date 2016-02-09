module PostsHelper

	def form_title

		@post.new_record? ? "Publicar Post" : "Editar Post"

	end
end

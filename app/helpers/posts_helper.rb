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

module PostsHelper

	def form_title

		@post.new_record? ? "Publicar Post" : "Editar Post"

	end
end

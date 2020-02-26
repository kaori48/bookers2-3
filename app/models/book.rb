class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :book_comments
	validates :title, presence: true
	validates :body, presence: true,length: {maximum: 200}
	# book投稿をいいねしているユーザーidがfavoriteにあるか
	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
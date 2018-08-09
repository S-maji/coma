class Post < ActiveRecord::Base
    mount_uploader :image_1, ImageUploader
    mount_uploader :image_2, ImageUploader
    mount_uploader :image_3, ImageUploader
    
    belongs_to :user
    has_many :reactions, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :user_id, presence: true
    validates :image_1, presence: true
    validates :title, length: {maximum: 12}
    validates :comment, length: {maximum: 150}
    
    default_scope -> { order('created_at DESC')}
    
    def self.from_users_followed_by(user)
      followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
      where("user_id IN (#{followed_user_ids})", user_id: user.id).where(created_at: (1.days.ago)..(Time.now))
    end
    
    def favorite?(user)
      favorites.find_by(user_id: user.id)
    end
    
    def favorite!(user)
      favorites.create!(user_id: user.id)
    end
    
    def unfavorite!(user)
      favorites.find_by(user_id: user.id).destroy
    end
    
end

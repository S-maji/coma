class Reaction < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    validates :post_id, presence: true
    validates :user_id, presence: true
    validates :comment, presence: true, length: {maximum: 50}
end

class Comment < ActiveRecord::Base
  belongs_to :topic, :counter_cache => true # comments_count
  belongs_to :user

  validates_presence_of :content, :user_id

  def author_name
    user.try(:display_name) || "Nobody"
  end
end

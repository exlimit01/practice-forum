class Topic < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :content, :user_id

  belongs_to :user
  has_many :topic_categories
  has_many :categories, :through => :topic_categories

  def author_name
    user.try(:display_name) || "Nobody"
  end
end

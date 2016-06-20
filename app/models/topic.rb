class Topic < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :content, :user_id

  belongs_to :user

  def author_name
    user.try(:display_name) || "Nobody"
  end
end

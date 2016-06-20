class Topic < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :content

  belongs_to :user

  def author_name
    user.try(:display_name) || "Nobody"
  end
end

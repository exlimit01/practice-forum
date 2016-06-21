class Topic < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :content, :user_id

  belongs_to :user
  has_many :topic_categories
  has_many :categories, :through => :topic_categories

  def author_name
    user.try(:display_name) || "Nobody"
  end

  def authors
    arr = self.comments.map{ |c| c.user }
    arr << self.user
    arr.uniq
  end

  def can_delete_by?(u)
    ( self.user == u ) || (u.is_admin?)
  end
end

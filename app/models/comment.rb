class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  def author_name
    user.try(:display_name) || "Nobody"
  end
end

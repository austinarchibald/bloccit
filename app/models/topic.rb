class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) } # This uses a lambda syntax (the arrow -> with a block) that is the proper way to pass a piece of code into a scope definition. This scope returns the equivalent of topic_collection.all or topic_collection.where(public: true), depending on the value of user. 
end

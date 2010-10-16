class Joke < ActiveRecord::Base
  default_scope :order => 'created_at desc'
  MAX_LENGTH = 300

  validates_length_of :body, :maximum => 300
  validates_presence_of :body
  attr_protected :points, :user_id

end

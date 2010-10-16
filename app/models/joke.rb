class Joke < ActiveRecord::Base
  MAX_LENGTH = 300
  MAX_COUNT = 8

  has_many :votes

  validates_length_of :body, :maximum => 300
  validates_presence_of :body
  attr_protected :points, :user_id

  def to_param
    "#{self.id}-#{body[0..40].gsub(/[^a-zA-Z_ ]/, '').gsub(' ','-')}"
  end


end

class Vote < ActiveRecord::Base
  after_create :increase_points

  belongs_to :joke

  private

  def increase_points
    Joke.transaction do
      self.joke.update_attribute(:points, joke.points+1)
    end

  end
end

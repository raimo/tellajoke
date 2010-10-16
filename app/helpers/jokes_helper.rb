module JokesHelper

  def short_body(body)
    truncate(body, :length => 25, :omission => '...')
  end
end

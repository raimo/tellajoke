module JokesHelper

  def short_body(body)
    truncate(body, :length => 100, :omission => '...')
  end
end

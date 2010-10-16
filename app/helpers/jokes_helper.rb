module JokesHelper

  def short_body(body)
    truncate(body, :length => 40, :omission => '...')
  end
end

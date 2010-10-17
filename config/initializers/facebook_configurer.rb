if RAILS_ENV == 'production'
  require "#{Rails.root}/../../shared/facebook.rb"
else
  require "#{Rails.root}/../shared/facebook.rb"
end

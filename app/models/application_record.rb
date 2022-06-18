class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.current_user
    User.first
  end
end

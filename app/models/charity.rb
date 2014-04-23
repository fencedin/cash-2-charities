class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates :mission, presence: true
end

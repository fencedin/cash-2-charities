class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates :mission, presence: true
  validate :check_future_date

  def check_future_date
    if self.founded > Date.today
      errors.add :founded, 'date cannot be in the future.'
    end
  end
end

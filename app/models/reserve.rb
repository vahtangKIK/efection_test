class Reserve < ApplicationRecord
  belongs_to :place
  before_save :validate

private 

  def validate
    check_self
    check_schedule
    check_busy
    true
  end

  def check_schedule
    range = { start: self.reserve_time_begin, finish: self.reserve_time_end}
    unless self.place.restraunt.check_schedule(range)
      throw :abort
    end
    true
  end

  def check_busy
    range = { start: self.reserve_time_begin, finish: self.reserve_time_end}
    unless self.place.check_busy(range, self. self.id)
      throw :abort
    end
    true
  end

  def check_self
    self.reserve_time_begin < self.reserve_time_end
  end
end

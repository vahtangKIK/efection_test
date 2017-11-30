class Restraunt < ApplicationRecord
  has_many :place
  before_save :validate_schedule

  def check_schedule(range)
    
    today_start = range[:start].beginning_of_day + self.schedule_begin
    today_end = today_start.beginning_of_day + self.schedule_end

    if range[:start] >= today_start && range[:finish] <= today_end
      return true
    end
   
   yesterday_start = range[:start].beginning_of_day.yesterday + self.schedule_begin
   yesterday_end = yesterday_start + self.schedule_end

    if range[:start] >= yesterday_start && range[:finish] <= yesterday_end
      return true
    end
    false
  end  

private
  def validate_schedule
    if self.schedule_begin >= 86400 || self.schedule_end >= 172800
      throw :abort
    end
  end
end

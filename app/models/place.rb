class Place < ApplicationRecord
  belongs_to :restraunt 
  has_many :reserve
  before_save :check_name
  
  def check_busy(range, id)
    if Reserve.where("reserve_time_begin between ? and ? #{id.nil? ? '': "and id != #{id.to_i}"}", range[:start], range[:finish]).exists? ||
       Reserve.where("reserve_time_end between ? and ? #{id.nil? ? '': "and id != #{id.to_i}"}", range[:start], range[:finish]).exists? ||
       Reserve.where("? between reserve_time_begin and reserve_time_end #{id.nil? ? '': "and id != #{id.to_i}"}", range[:start]).exists? ||
       Reserve.where("? between reserve_time_begin and reserve_time_end #{id.nil? ? '': "and id != #{id.to_i}"}", range[:finish]).exists?
       throw :abort
    end
    true 
  end

  def add_reserve(start, finish, people, comment)
    raise 'not implemented'
  end

private

  def check_name # validate name
    true
  end 
end

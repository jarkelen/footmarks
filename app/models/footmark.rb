class Footmark < ActiveRecord::Base
    
    
  def assign_nr
    #vinks = Vink.where("user_id = :user_id and (vink_date < :vink_date)", user_id: vink.user_id, vink_date: vink.vink_date).count + 1
  end
end

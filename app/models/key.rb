class Key < ActiveRecord::Base
after_validation :limit_date, on: :create

private
  def limit_date
    @licence = LicenceKey.where(:key => self.key)
    if @licence.size > 0
       if (@licence.first.deadline)
          @limitdate = @licence.first.deadline
       elseif (@licence.first.creation)
	  @limitdate = @licence.first.creation + 1.years + 1.months
       elseif (@licence.first.created_at)
          @limitdate = @licence.first.created_at + 1.years + 1.months
       else
          @limitdate = self.endtime
       end
       if (self.endtime > @limitdate)
          self.endtime = @limitdate
       end
       @licence.first.update(deadline: self.endtime)
    end
  end
end

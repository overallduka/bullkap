module ApplicationHelper

    def to_date(date)
        date.in_time_zone('Brasilia').strftime("%d/%m/%y %H:%Mh")
    end

  def to_phone(phone)
    return "" if phone.blank? || (phone.length != 10 && phone.length != 11)
    @p = 8
    @p = 9 if phone.length == 11
    phone.insert(0,'(').insert(3,')').insert(@p,'-').insert(4,' ')if @p                    end

end

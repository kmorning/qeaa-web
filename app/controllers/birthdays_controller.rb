class BirthdaysController < ApplicationController
  def index
    # TODO: maybe put this logic in a model and allow for variable days
    # TODO: add birthday postable role to members, so that we can control
    # whether or not a birthday is automatically shown.
    #start_date = (Date.today - Date.today.mday + 1)
    #start_date = Date.parse(Time.zone.now.to_s)
    start_date = Date.today.advance(days: -15)
    end_date = start_date.advance(days: +45)
    @members = Member.find_birthdays_for(start_date, end_date).with_role(:viewable).sort_by{ |m| [m.birthday.month, m.birthday.day] }
  end
end

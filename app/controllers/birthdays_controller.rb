class BirthdaysController < ApplicationController
  def index
    # TODO: maybe put this logic in a model and allow for variable days
    # TODO: add birthday postable role to members, so that we can control
    # whether or not a birthday is automatically shown.
    start_date = Date.today.in_time_zone
    end_date = start_date.advance(days: +45)
    @members = Member.find_birthdays_for(start_date, end_date).sort_by{ |m| [m.birthday.month, m.birthday.day] }
  end
end

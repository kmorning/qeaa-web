class EventSchedulePolicy
  attr_reader :member, :event_schedule

  def initialize(member, event_schedule)
    @member = member
    @event_schedule = event_schedule
  end

  def index?
    # TODO: Make publicly visible?
    @member.has_role? :admin
  end

  def new?
    @member.has_role? :admin
  end

  def edit?
    # TODO: allow event_schedule admin to edit.
    @member.has_role? :admin
  end 

  def create?
    @member.has_role? :admin
  end

  def update?
    @member.has_role? :admin
  end

  def destroy?
    @member.has_role? :admin
  end

  def show?
    #TODO: allow event_schedule members to view.  For now only admin.
    #@event_schedule.id == @member.event_schedule_id or @member.has_role?(:admin)
    @member.has_role? :admin
  end

end


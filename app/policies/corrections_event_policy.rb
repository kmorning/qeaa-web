class CorrectionsEventPolicy
  attr_reader :member, :corrections_event

  def initialize(member, corrections_event)
    @member = member
    @corrections_event = corrections_event
  end

  def index?
    # TODO: Make publicly visible?
    @member.has_role? :admin
  end

  def new?
    @member.has_role? :admin
  end

  def edit?
    # TODO: allow corrections_event admin to edit.
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
    #TODO: allow corrections_event members to view.  For now only admin.
    #@corrections_event.id == @member.corrections_event_id or @member.has_role?(:admin)
    @member.has_role? :admin
  end

end


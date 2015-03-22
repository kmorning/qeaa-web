class MeetingPolicy
  attr_reader :member, :meeting

  def initialize(member, meeting)
    @member = member
    @meeting = meeting
  end

  def new?
    @member.has_role? :admin
  end

  def edit?
    # TODO: allow group admin to edit.
    @member.has_role? :admin
  end

  def create?
    @member.has_role? :admin
  end

  def update?
    # TODO: allow group admin to update.
    @member.has_role? :admin
  end

  def destroy?
    @member.has_role? :admin
  end

end


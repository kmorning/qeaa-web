class MeetingPolicy
  attr_reader :member, :meeting

  def initialize(member, meeting)
    @member = member
    @meeting = meeting
  end

  def new?
    @member.has_role? :admin
  end

  def create?
    @member.has_role? :admin
  end

end


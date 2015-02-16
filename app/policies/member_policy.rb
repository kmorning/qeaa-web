class MemberPolicy
  attr_reader :current_member, :member

  def initialize(current_member, member)
    @current_member = current_member
    @member = member
  end

  def new?
    @current_member.has_role? :admin
  end

  def create?
    @current_member.has_role? :admin
  end

  def show?
    @member.group_id == @current_member.group_id or
      @current_member.has_role?(:admin)
  end

end

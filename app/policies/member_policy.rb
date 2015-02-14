class MemberPolicy
  attr_reader :current_member, :member

  def initialize(current_member, member)
    @current_member = current_member
    @member = member
  end

  def new?
    @current_member.has_role?(:admin) or 
      @current_member.has_role?(:group_admin)
  end

  def create?
    @current_member.has_role? :admin or
      (@current_member.has_role?(:group_admin) and
       @member.group_id == @current_member.group_id)
  end

  def show?
    @current_member.has_role?(:admin) or 
      @member.group_id == @current_member.group_id
  end

end


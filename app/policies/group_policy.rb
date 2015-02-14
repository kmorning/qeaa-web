class GroupPolicy
  attr_reader :member, :group

  def initialize(member, group)
    @member = member
    @group = group
  end

  def new?
    @member.has_role? :admin
  end

  def create?
    @member.has_role? :admin
  end

  def show?
    @member.has_role?(:admin) or @group == @member.group
  end

end


class GroupPolicy
  attr_reader :member, :group

  def initialize(member, group)
    @member = member
    @group = group
  end

  def index?
    # TODO: Make publicly visible?
    @member.has_role? :admin
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
    @member.has_role? :admin
  end

  def destroy?
    @member.has_role? :admin
  end

  def show?
    #TODO: allow group members to view.  For now only admin.
    #@group.id == @member.group_id or @member.has_role?(:admin)
    @member.has_role? :admin
  end

end


class MedallionPolicy
  attr_reader :member, :medallion

  def initialize(member, medallion)
    @member = member
    @medallion = medallion
  end

  def index?
    @member.has_role? :admin
  end

  def show?
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
 
end

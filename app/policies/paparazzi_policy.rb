class PaparazziPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return user.company_name != nil
  end

  def create?
    return user.company_name != nil
  end

  def index?
    return true
  end

  def edit?
    return record.user_id == user.id
  end

  def update?
    return record.user_id == user.id
  end

  def destroy?
    return record.user_id == user.id
  end
end

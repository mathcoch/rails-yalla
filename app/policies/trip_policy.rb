class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope c'est Trip
      scope.where(user: user) && scope.where(public: true)
    end
  end

  def create?
    true # tous les users peuvent creer un trip
  end

  def show?
    true # tous les users peuvent creer un trip
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    # TODO: seul le user peut modifier le resto
    # record => @trip
    # user => current_user
    user.admin || record.user == user if user
  end

end

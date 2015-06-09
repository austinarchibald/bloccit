class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope

    def resolve
      if user.present?
        if user.admin? || user.moderator?
          scope.all
        else
          scope.where(user: user.id)
        end
      else
        scope.none
      end
    end

  end

end
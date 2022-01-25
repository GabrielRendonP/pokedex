class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_ability
    @current_ability ||= ::Ability.new(current_trainer)
  end
end

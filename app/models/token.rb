class Token < ApplicationRecord
  default_scope { where(disabled: false) }

  before_save :assign_value

  def invalidate!
    update!(disabled: true)
  end

  private

  def assign_value
    self.value = SecureRandom.hex if value.blank?
  end
end
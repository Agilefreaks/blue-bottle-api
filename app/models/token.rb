class Token < ApplicationRecord
  default_scope { where(disabled: false) }

  def invalidate!
    update!(disabled: true)
  end
end
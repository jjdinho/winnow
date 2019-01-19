class SecurityHex < ApplicationRecord
  validates :hex, presence: true
end

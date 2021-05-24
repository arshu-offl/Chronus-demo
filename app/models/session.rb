class Session < ApplicationRecord
  validates :session_hash, uniqueness: true
end

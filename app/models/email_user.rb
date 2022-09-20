class EmailUser < User
  has_many :otps, dependent: :destroy, foreign_key: :user_id
end


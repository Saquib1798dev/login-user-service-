class User < ApplicationRecord
  attr_accessor :login

  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self, authentication_keys: [:login]

  self.table_name = :users
  has_many :otps, dependent: :destroy
  def login
    @login || self.full_phone_number || self.email
  end
  

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    find_by(full_phone_number: conditions[:login]) || find_by(email: conditions[:login])
    # if (login = conditions.delete(:login))
    #   where(conditions.to_h).where(["full_phone_number = :value OR lower(email) = :value", { :value => login.downcase }]).first
    # elsif conditions.has_key?(:full_phone_number) || conditions.has_key?(:email)
    #   where(conditions.to_h).first
    # end
  end
         
end


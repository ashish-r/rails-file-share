class User < ApplicationRecord
    has_secure_password
    validates :user_name, :full_name, :email, :password, presence: true
    validates :user_name, length: { maximum: 15 }, uniqueness: true
    validates :password, :length=>{ minimum: 6 }
end

class Member < ApplicationRecord
	validates :email, :uniqueness => { :case_sensitive => true }
	has_secure_password
end

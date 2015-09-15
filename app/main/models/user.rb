# By default Volt generates this User model which inherits from Volt::User,
# you can rename this if you want.
class User < Volt::User
  # The login_field method returns the name that should be used for the field
  # where the users e-mail is stored.  (usually :username or :email)
  def self.login_field
    :email
  end

# login_field is set to :email by default and can be set to
  field login_field
  field :name

  validate login_field, unique: true, length: 8
  validate :email, email: true
end

class UsersController < Clearance::UsersController

  def user_from_params
	byebug
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    avatar = user_params.delete(:avatar)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.avatar = avatar
    end
  end
end
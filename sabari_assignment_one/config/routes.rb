Rails.application.routes.draw do
 

  get 'friends/home'
  get 'friends/communication'
  get 'friends/add_chat'
  get 'user/friends'
  get 'user/user_sign_up'
  get 'user/update_new_user'
  get "/user/validate_user" => "user#validate_user"
  root 'user#login'

end

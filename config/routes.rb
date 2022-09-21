Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login'
  },
  controllers: {
    sessions: 'users/sessions'
  } 
  post 'users/forgot_password' => "users/passwords#forgot"
  post 'users/reset_password' => "users/passwords#reset"
 # get 'users/verify_otp' => "users/passwords#verify_otp"
  match 'users/verify_otp' => 'users/passwords#verify_otp', via: [:post]

end
def sign_up_and_sign_in
  user = create_user(email: "simon@simon.com", password: "secrets")
  sign_in(email: "simon@simon.com", password: "secrets")
  user 
end

def create_user(email:, password:)
  User.create(email: email, password: password, password_confirmation: password)
end

def sign_in(email:, password:)
  visit "/users/sign_in"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log in"
end

def create_post(message:, user_id:)
  Post.create(message: message, user_id: user_id)
  visit "/posts"
end
def sign_up_and_sign_in
  create_user(email: "simon@simon.com", password: "secrets")
  sign_in(email: "simon@simon.com", password: "secrets")
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

def create_then_view_posts(message:)
  post = Post.create(message: message)
  visit "/posts"
  post
end
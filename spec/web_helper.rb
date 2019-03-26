def sign_up_and_sign_in
  User.create(email: "simon@simon.com", password: "secrets", password_confirmation: "secrets")
  visit "/users/sign_in"
  fill_in "user_email", with: "simon@simon.com"
  fill_in "user_password", with: "secrets"
  click_button "Log in"
end
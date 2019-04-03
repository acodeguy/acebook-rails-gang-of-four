def create_user_and_sign_in(email: "simon@simon.com", password: "secrets")
  user = create_user(email: email, password: password)
  sign_in(email: email, password: password)
  user 
end

def create_user(email:, password:)
  User.create(email: email, password: password, password_confirmation: password)
end

def register(email: "simon@simon.com", password: "secrets")
  post '/auth', params: { email: email, password: password, password_confirmation: password }

  user_auth = {}
  user_auth[:token] = response.header['access-token']
  user_auth[:client] = response.header['client']
  user_auth[:user_id] = JSON.parse(response.body)['data']['id']
  user_auth[:email] = email

  user_auth
end

def sign_in(email:, password:)
  visit "/users/sign_in"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log in"
end

def create_then_view_posts(message:, user_id:)
  post = Post.create(message: message, user_id: user_id)
  visit "/posts"
  post
end
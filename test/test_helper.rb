module AuthenticationHelpers
  def login_as(user)
    if respond_to? :visit
      visit login_url
      fill_in :name, with: user.name
      fill_in :password, with: 'secret'
      click_on 'Login'
    else
      post login_url, params: { name: user.name, password: 'secret' }
    end
  end
  def logout
    delete logout_url
  end
  def setup
    login_as users(:one)
  end
end
class ActionDispatch::IntegrationTest
  include AuthenticationHelpers
end
class ActionDispatch::SystemTestCase
  include AuthenticationHelpers
end
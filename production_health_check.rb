require 'capybara/rspec'

Capybara.current_driver = :selenium_headless
Capybara.javascript_driver = :selenium_headless
Capybara.app_host = 'https://mediagraph.io'

RSpec.feature 'Production Uptime Check', type: :system do
  it 'loads React app' do
    visit('/')

    within '#header' do
      2.times { click_on 'Login' }
    end

    expect(page).to have_content(/MediaGraph Login/)
    expect(page).to have_content(/Sign Up/)
    expect(page).to have_content(/Forgot Password/)

    # expect(page).to have_content 'fail test'
  end
end

retries = 0
loop do
  if RSpec::Core::Runner.run([]) == 1
    retries += 1

    if retries > 5
      exec ENV.fetch('production_health_check_fail_cmd', 'echo "mediagraph.io down"')

      raise 'failed'
    end

    sleep 5
  else
    break
  end
end

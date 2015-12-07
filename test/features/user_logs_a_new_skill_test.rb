require_relative '../test_helper'

class UserLogsANewSkill < FeatureTest
  def test_a_user_can_log_a_new_skill

    visit '/skills/new'
    fill_in 'skill[name]', :with => "Bustin a Move"
    fill_in 'skill[status]', :with => "Top 20 Ever"
    click_button('submit')
    assert_equal '/skills', current_path
    within('.main_content') do
      assert page.has_content?("Bustin a Move")
    end
  end
end

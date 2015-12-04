require_relative '../test_helper'

class UserLogsANewSkill < FeatureTest
  def test_a_user_can_log_a_new_skill
    #As a user
    #When I am on the new skill page
    #And I enter a new skill
    #And I enter a new description
    #And I click Add To Skills
    #Then I am redirected to the skills index and see my new skill
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

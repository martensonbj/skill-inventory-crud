require_relative '../test_helper'

class UserSeesAllSkillsTest < FeatureTest
  def test_user_sees_index_of_tasks

  SkillInventory.create({ :name => "Droppin Beats}", :status => "Pretty Awesome"})
  SkillInventory.create({ :name => "Other Stuff}", :status => "Also Good At It"})
    # As a user
    # When I visit the skills page
    # Then I see a list of skills

    visit '/skills'

    within('.main_content') do
      assert page.has_content?("Droppin Beats")
      assert page.has_content?("Other Stuff")
    end
  end
end

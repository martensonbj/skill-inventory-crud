require_relative '../test_helper'

class UserSeesAllSkillsTest < FeatureTest

  def test_user_sees_index_of_tasks
    SkillInventory.create({ :name => "Droppin Beats}", :status => "Pretty Awesome"})

    visit '/skills'

    within('.main_content') do
      assert page.has_content?("Droppin Beats")
      assert page.has_content?("Other Stuff")
    end
  end
  
end

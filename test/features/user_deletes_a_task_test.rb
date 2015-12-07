require_relative '../test_helper'

class UserDeletesASkill < FeatureTest

  def create_skills(num)
    num.times do |n|
      SkillInventory.create({ :name => "a name#{n+1}",
                              :status => "a status#{n+1}"})
    end
  end

  def test_a_user_can_delete_a_skill
    create_skills(1)

    visit '/skills'

    within('.main_content') do
      assert page.has_content?("a name1")
    end

    click_button('delete')
    within('.main_content') do
      refute page.has_content?("a name1")
    end

    assert_equal '/skills', current_path

  end
end

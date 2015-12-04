require_relative '../test_helper'

class UserEditsASkill < FeatureTest

  def create_skills(num)
    num.times do |n|
      SkillInventory.create({ :name => "a name#{n+1}",
                              :status => "a status#{n+1}"})
    end
  end

  def test_a_user_can_edit_a_skill
    #As a user
    #When I am on the skill edit page
    #And I click edit
    #And I enter a new title
    #And I click submit
    #Then I am redirected to the individual skill page and the title is now updated
    create_skills(1)
    id = SkillInventory.all.last.id

    visit "/skills/#{id}/edit"

    fill_in 'skill[name]', :with => "new skill name"
    click_button('submit')

    assert_equal "/skills/#{id}", current_path
    within('.main_content') do
      assert page.has_content?("new skill name")
    end
  end

  end

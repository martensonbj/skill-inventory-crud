require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def create_skills(num)
    num.times do |n|
      SkillInventory.create({ :name => "a name#{n+1}",
                              :status => "a status#{n+1}"})
    end
  end

  def test_it_creates_a_skill
    create_skills(1)

    skill = SkillInventory.all.last

    assert_equal "a name1", skill.name
    assert_equal "a status1", skill.status
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_it_creates_two_skills
    skills = create_skills(2)
    # skill2 = SkillInventory.find(2)
    skill2 = SkillInventory.all.last


    assert_equal "a name2", skill2.name
    assert_equal "a status2", skill2.status
    assert_equal 2, skills
  end

  def test_it_creates_all_skills
    skills = create_skills(4)

    all_skills = SkillInventory.all
    assert_equal 4, skills
  end

  def test_count_is_0_with_no_tasks
    all_skills = SkillInventory.all
    assert_equal 0, all_skills.count
  end

  def test_it_updates_the_name_of_a_skill
    skills = create_skills(1)
    id = SkillInventory.all.last.id

    skill = SkillInventory.find(id)
    assert_equal "a name1", skill.name
    assert_equal "a status1", skill.status

    SkillInventory.update(id, {:name => "new name", :status => "new status"})

    new_skill = SkillInventory.find(id)

    assert_equal "new name", new_skill.name
    assert_equal "new status", new_skill.status
  end

  def test_it_deletes_a_skill
    create_skills(3)
    total = SkillInventory.all.count 

    SkillInventory.delete(SkillInventory.all.first.id)

    assert_equal (total -1), SkillInventory.all.count
  end

end

require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({ :name    => "a name",
                        :status  => "a status",
                        :id      => 1 })
    assert_equal "a name", skill.name
    assert_equal "a status", skill.status
    assert_equal 1, skill.id
  end
end

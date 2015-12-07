require 'yaml/store'
require 'pony'

class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.raw_skills
    database.transaction do
      database['skills'] || []
    end
  end

  def self.all
    raw_skills = database.from(:skills).to_a
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.create(skill)
    database.from(:skills).insert(name: skill[:name], status: skill[:status])
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id}
  end

  def self.find(id)
    data = database.from(:skills).where(id: id).to_a.first
    Skill.new(data)
  end

  def self.update(id, data)
    database.from(:skills).where(:id => id).update(data)
  end

  def self.delete(id)
    database.from(:skills).where(id: id).delete
  end

  def self.delete_all
    database.transaction do
      database['tasks'] = []
      database['total'] = 0
    end
  end

end

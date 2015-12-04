class Skill
  attr_reader :name,
              :status,
              :id

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @status      = data[:status]
  end
end

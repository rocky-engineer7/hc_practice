require_relative 'name_service'

class Player
  include NameService

  def initialize(name)
    @name = name
  end
end

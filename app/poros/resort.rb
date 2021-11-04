class Resort
  attr_reader :id, :name

  def initialize(info)
    @id = info[:id]
    @name = info[:resortName]
  end
end

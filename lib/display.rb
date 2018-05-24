class Display
  def initialize(output = STDOUT)
    @output = output
  end

  def print(statement)
    output.puts statement
  end

  private

  attr_reader :output
end

require_relative 'formats/statement'
require_relative 'statement_line'

class Statement
  include Formats::Statement

  def self.create_from(transactions)
    running_balance = 0
    statement_lines = transactions.map do |transaction|
      running_balance += transaction.credit || transaction.debit
      StatementLine.new(transaction, running_balance)
    end

    new(statement_lines)
  end

  def initialize(statement_lines)
    @statement_lines = statement_lines
  end

  def to_s
    statement_lines.map(&:to_s).reverse.unshift(statement_header).join("\n")
  end

  private

  attr_reader :statement_lines
end

require_relative 'formats/statement'

class StatementLine
  include Formats::Statement

  def initialize(transaction, balance)
    @transaction = transaction
    @balance = balance
  end

  def to_s
    HEADER.map do |column_name|
      if column_name == 'balance'
        balance
      else
        transaction.send(column_name)
      end
    end.join(DELIMITER)
  end

  private

  attr_reader :transaction, :balance
end

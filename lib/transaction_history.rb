class TransactionHistory
  attr_reader :transactions

  def initialize(transaction = Transaction)
    @transaction = transaction
    @transactions = []
  end

  def create_transaction(value, type)
    new_transaction = transaction.new(value, type)
    save(new_transaction)
    new_transaction
  end

  private

  def save(transaction)
    transactions << transaction
  end

  attr_reader :transaction
end

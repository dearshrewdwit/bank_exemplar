class Account
  def initialize(transaction_history = TransactionHistory.new)
    @transaction_history = transaction_history
  end

  def deposit(value)
    create_transaction(value, :credit)
  end

  def withdraw(value)
    create_transaction(value, :debit)
  end

  def transactions
    transaction_history.transactions
  end

  private

  attr_reader :transaction_history

  def create_transaction(value, type)
    transaction_history.create_transaction(value, type)
  end
end

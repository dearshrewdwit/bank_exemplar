require 'transaction_history'

RSpec.describe TransactionHistory do
  let(:transaction_class) { double('transaction class', new: transaction) }
  let(:transaction) { double('transaction') }
  let(:amount) { 5 }

  subject(:transaction_history) { described_class.new(transaction_class) }

  describe '#create_transaction' do
    let(:type) { :credit }

    it 'returns a new transaction' do
      expect(transaction_history.create_transaction(amount, type)).to eq transaction
    end

    it 'stores a transaction' do
      transaction_history.create_transaction(amount, type)
      expect(transaction_history.transactions).to include(transaction)
    end
  end
end

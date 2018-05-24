require 'account'

RSpec.describe Account do

  let(:transaction_history) { double('transaction history', transactions: list) }
  let(:transaction) { double('transaction') }
  let(:list) { [] }
  let(:amount) { 5 }

  subject(:account) { described_class.new(transaction_history) }

  describe '#deposit' do
    it 'returns a new transaction' do
      allow(transaction_history).to receive(:create_transaction).with(amount, :credit).and_return(transaction)
      expect(account.deposit(amount)).to eq transaction
    end
  end

  describe '#withdraw' do
    it 'returns a new transaction' do
      allow(transaction_history).to receive(:create_transaction).with(amount, :debit).and_return(transaction)
      expect(account.withdraw(amount)).to eq transaction
    end
  end

  describe 'transaction' do
    it 'instructs history to return a list' do
      expect(account.transactions).to eq list
    end
  end
end

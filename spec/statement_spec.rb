require 'statement'

RSpec.describe Statement do
  let(:transactions) { [credit_transaction, debit_transaction] }
  let(:credit_transaction) { double(credit: 500, debit: nil, date: '05/24/2018') }
  let(:debit_transaction) { double(credit: nil, debit: -500, date: '05/24/2018') }
  let(:statement) { described_class.create_from(transactions) }

  let(:expected) do
    "date || credit || debit || balance\n05/24/2018 ||  || -500 || 0\n05/24/2018 || 500 ||  || 500"
  end

  describe '#to_s' do
    it 'returns a formatted statement' do
      expect(statement.to_s).to eq expected
    end
  end
end

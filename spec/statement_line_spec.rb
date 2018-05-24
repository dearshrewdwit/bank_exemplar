require 'statement_line'

RSpec.describe StatementLine do
  let(:balance) { 100 }

  subject(:statement_line) { described_class.new(transaction, balance) }

  describe '#to_s' do
    context 'credit' do
      let(:transaction) { double('transaction', credit: 100, debit: nil, date: '05/24/2018') }

      it 'returns a formatted string' do
        expect(statement_line.to_s).to eq "#{transaction.date} || #{transaction.credit} ||  || #{balance}"
      end
    end

    context 'debit' do
      let(:transaction) { double('transaction', credit: nil, debit: 100, date: '05/24/2018') }

      it 'returns a formatted string' do
        expect(statement_line.to_s).to eq "#{transaction.date} ||  || #{transaction.debit} || #{balance}"
      end
    end
  end
end

require "transactions"

RSpec.describe Transactions do
  subject(:transactions) { Transactions.new }

  let(:today) { Date.parse("11-01-2016") }

  it "takes a deposit" do
    transactions.deposit(1000, today)
    transaction = Transaction.new(credit: 1000, date: today)

    expect(transactions.first).to eq(transaction)
  end

  it "takes a withdrawal" do
    transactions.withdraw(500, today)
    transaction = Transaction.new(debit: 500, date: today)

    expect(transactions.first).to eq(transaction)
  end
end

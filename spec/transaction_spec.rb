require "transaction"

RSpec.describe Transaction do
  subject(:transaction) { Transaction.new(debit: 1000, credit: 250, date: Date.today) }

  it "is the same as other transactions with the same total and date" do
    same_transaction = Transaction.new(debit: 1000, credit: 250, date: Date.today)
    other_transaction = Transaction.new(credit: 250, date: Date.today)

    expect(transaction).to eq(same_transaction)
    expect(transaction).to_not eq(other_transaction)
    expect(transaction).to_not eq("not a transaction")
  end

  it "has a total which is the credit minus the debit" do
    expect(transaction.total).to eq(-750)
  end
end

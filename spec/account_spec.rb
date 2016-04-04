require "account"
require "date"

describe Account do

  subject(:account) { described_class.new(transactions: transactions) }

  let(:transactions) { instance_spy("Transactions") }
  let(:statement) { File.read("spec/support/statement.txt") }
  let(:today) { Date.today }

  it "stores a deposit" do
    account.deposit(1000, today)
    expect(transactions).to have_received(:deposit).with(1000, today)
  end

  it "stores a withdrawal" do
    account.withdraw(500, today)
    expect(transactions).to have_received(:withdraw).with(500, today)
  end

  it "submits a statement" do
    all = [
      Transaction.new(credit: 1000, date: Date.parse("10-01-2012")),
      Transaction.new(credit: 2000, date: Date.parse("13-01-2012")),
      Transaction.new(debit: 500, date: Date.parse("14-01-2012"))
    ]

    allow(transactions).to receive(:all).and_return(all)

    output = spy(:output)
    account.print_statement(output)

    expect(output).to have_received(:puts).with(statement)
  end
end

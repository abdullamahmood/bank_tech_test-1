require "account"
require "date"

RSpec.describe Account do

  subject(:account) { described_class.new(transactions: transactions, statement: statement) }

  let(:transactions) { instance_spy("Transactions") }
  let(:statement) { class_spy("Statement") }
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
    allow(statement).to receive(:new).with(transactions).and_return(:statement)
    output = spy(:output)

    account.print_statement(output)

    expect(output).to have_received(:puts).with("statement")
  end
end

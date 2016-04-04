require "statement"

RSpec.describe Statement do

  let(:expected_statement) { File.read("spec/support/statement.txt") }
  let(:presenter_class) { class_spy("TransactionPresenter") }

  let(:presenter1) { presenter(credit: "1000.00", debit: nil, balance: "1000.00", date: "10/01/2012") }
  let(:presenter2) { presenter(credit: "2000.00", debit: nil, balance: "3000.00", date: "13/01/2012") }
  let(:presenter3) { presenter(credit: nil, debit: "500.00", balance: "2500.00", date: "14/01/2012") }

  it "renders a statement" do
    transactions = [
      stub_transaction(1000, 1000, presenter1),
      stub_transaction(2000, 3000, presenter2),
      stub_transaction(-500, 2500, presenter3)
    ]

    statement = described_class.new(transactions, presenter: presenter_class)

    expect(statement.to_s).to eq(expected_statement)
  end

  def stub_transaction(total, balance, presenter)
    transaction = instance_double("Transaction", total: total)
    allow(presenter_class).to receive(:new).with(transaction, balance).and_return(presenter)
    transaction
  end

  def presenter(data)
    presenter = instance_double("TransactionPresenter", data)
  end
end

require "statement"

RSpec.describe Statement do

  let(:expected_statement) { File.read("spec/support/statement.txt") }

  it "renders a statement" do
    transactions = [
      transaction(credit: 1000, total: 1000, date: "10-01-2012"),
      transaction(credit: 2000, total: 2000, date: "13-01-2012"),
      transaction(debit: 500, total: -500, date: "14-01-2012")
    ]

    statement = described_class.new(transactions)

    expect(statement.to_s).to eq(expected_statement)
  end

  def transaction(credit: 0, debit: 0, total:, date:)
    date = Date.parse(date)
    instance_double("Transaction", credit: credit, debit: debit, total: total, date: date)
  end
end

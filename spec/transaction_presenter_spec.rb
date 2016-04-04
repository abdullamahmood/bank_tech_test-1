require "transaction_presenter"

describe TransactionPresenter do

  subject(:presenter) { described_class.new(transaction, 200) }

  let(:today) { Date.parse("10-01-2014") }
  let(:transaction) { double(credit: 150, debit: 0, date: today) }

  it "formats numbers with two decimal places" do
    expect(presenter.credit).to eq("150.00")
    expect(presenter.balance).to eq("200.00")
  end

  it "formats numbers as an empty string when the value is 0" do
    expect(presenter.debit).to eq("")
  end

  it "formats the date" do
    expect(presenter.date).to eq(today.strftime(described_class::DATE_FORMAT))
  end
end

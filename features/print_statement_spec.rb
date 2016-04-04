require "account"
require "date"

RSpec.describe "Printing a statement", feature: true do

  subject(:account) { Account.new }

  let(:statement) { File.read("spec/support/statement.txt").strip }

  it "customer prints a statement of deposits and withdrawals" do
    account.deposit(1000, Date.parse("10-01-2012"))
    account.deposit(2000, Date.parse("13-01-2012"))
    account.withdraw(500, Date.parse("14-01-2012"))
    output = spy(:output)

    account.print_statement(output)

    expect(output).to have_received(:puts).with(statement)
  end
end

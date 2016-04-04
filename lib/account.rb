require "./lib/transactions"
require "./lib/statement"

class Account

  def initialize(transactions: nil, statement: nil)
    @transactions = transactions || Transactions.new
    @statement = statement || Statement
  end

  def deposit(amount, date = Date.today)
    transactions.deposit(amount, date)
  end

  def withdraw(amount, date = Date.today)
    transactions.withdraw(amount, date)
  end

  def print_statement(output = STDOUT)
    printed_statement = statement.new(transactions.all)
    output.puts(printed_statement.to_s)
  end

  private

  attr_reader :transactions, :statement
end

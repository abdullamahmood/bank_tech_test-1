require "./lib/transactions"

class Account

  def initialize(transactions:, statement:)
    @transactions = transactions || Transactions.new
    @statement = statement || Statement.new
  end

  def deposit(amount, date = Date.today)
    transactions.deposit(amount, date)
  end

  def withdraw(amount, date = Date.today)
    transactions.withdraw(amount, date)
  end

  def print_statement(output = STDOUT)
    output.puts(statement.new(transactions.all))
  end

  private

  attr_reader :transactions, :statement

end

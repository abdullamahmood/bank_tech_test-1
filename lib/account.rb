require "./lib/transactions"

class Account

  def initialize(transactions: Transactions.new)
    @transactions = transactions
  end

  def deposit(amount, date = Date.today)
    transactions.deposit(amount, date)
  end

  def withdraw(amount, date = Date.today)
    transactions.withdraw(amount, date)
  end

  def print_statement(output = STDOUT)
    balance = 0

    statement_lines = transactions.all.map do |transaction|
      balance += transaction.total

      "#{format_date(transaction.date)} || #{format_number(transaction.credit)} || #{format_number(transaction.debit)} || #{format_number(balance)}\n"
    end

    result = "date || credit || debit || balance\n"
    result += statement_lines.reverse.join("")
    output.puts(result)
  end

  private

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def format_number(number)
    return "" if number == 0
    '%.2f' % number
  end

  attr_reader :transactions
end

class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def to_s
    balance = 0

    statement_lines = transactions.map do |transaction|
      balance += transaction.total

      "#{format_date(transaction.date)} || #{format_number(transaction.credit)} || #{format_number(transaction.debit)} || #{format_number(balance)}\n"
    end

    result = "date || credit || debit || balance\n"
    result += statement_lines.reverse.join("")
  end

  private

  attr_reader :transactions

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def format_number(number)
    return "" if number == 0
    '%.2f' % number
  end

end

require "./lib/transaction_presenter"

class Statement

  HEADER = "date || credit || debit || balance\n"

  def initialize(transactions, presenter: TransactionPresenter)
    @transactions = parse(transactions, presenter)
  end

  def to_s
    HEADER + statement_lines.join("")
  end

  private

  attr_reader :transactions

  def parse(transactions, presenter)
    balance = 0
    transactions.map do |transaction|
      presenter.new(transaction, balance += transaction.total)
    end
  end

  def statement_lines
    transactions.reverse.map do |transaction|
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
  end
end

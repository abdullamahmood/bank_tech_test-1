require "./lib/transaction_presenter"

class Statement

  HEADERS = %w{date credit debit balance}
  SEPERATOR = " || "

  def initialize(transactions, presenter: TransactionPresenter)
    @transactions = parse(transactions, presenter)
  end

  def to_s
    [header, *statement_lines].join("\n")
  end

  private

  attr_reader :transactions

  def parse(transactions, presenter, balance = 0)
    transactions.map do |transaction|
      presenter.new(transaction, balance += transaction.total)
    end
  end

  def header
    HEADERS.join(SEPERATOR)
  end

  def statement_lines
    transactions.reverse.map do |transaction|
      HEADERS.map { |header| transaction.send(header) }.join(SEPERATOR)
    end
  end
end

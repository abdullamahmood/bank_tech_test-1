require "./lib/transaction"

class Transactions
  include Enumerable

  def initialize(transaction = Transaction)
    @all = []
    @transaction = transaction
  end

  def each(&block)
    all.each(&block)
  end

  def deposit(credit, date)
    all << transaction.new(credit: credit, date: date)
  end

  def withdraw(debit, date)
    all << transaction.new(debit: debit, date: date)
  end

  private

  attr_reader :transaction, :all
end

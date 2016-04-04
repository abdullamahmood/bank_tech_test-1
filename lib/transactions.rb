require "./lib/transaction"

class Transactions

  attr_reader :all

  def initialize(transaction = Transaction)
    @all = []
    @transaction = transaction
  end

  def deposit(credit, date)
    all << transaction.new(credit: credit, date: date)
  end

  def withdraw(debit, date)
    all << transaction.new(debit: debit, date: date)
  end

  private

  attr_reader :transaction
end

class TransactionPresenter

  DATE_FORMAT = "%d/%m/%Y"
  NUMBER_FORMAT = "%.2f"

  def initialize(transaction, balance)
    @transaction = transaction
    @balance = balance
  end

  def credit
    format_number(transaction.credit)
  end

  def debit
    format_number(transaction.debit)
  end

  def balance
    format_number(@balance)
  end

  def date
    transaction.date.strftime(DATE_FORMAT)
  end

  private

  attr_reader :transaction

  def format_number(number)
    return "" if number == 0
    NUMBER_FORMAT % number
  end
end

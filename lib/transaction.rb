class Transaction

  attr_reader :debit, :credit, :date

  def initialize(debit: 0, credit: 0, date:)
    @debit = debit
    @credit = credit
    @date = date
  end

  def ==(other)
    return false unless other.is_a?(Transaction)
    self.total == other.total && self.date == other.date
  end

  def total
    credit - debit
  end
end

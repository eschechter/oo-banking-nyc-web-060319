class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  # your code here
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !@sender.valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif valid? && @status == "pending"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
    end

    def reverse_transfer
      if @status == "complete"
        @sender.balance += amount
        @receiver.balance -= amount  
        @status = "reversed"   
      end
    end
  end


end

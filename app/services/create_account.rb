class CreateAccount < ApplicationService
  def initialize(payload, from_fintera = false)
    @payload = payload
    @from_fintera = from_fintera
    @errors = []
  end

  def call
    if !is_account_valid?
      @errors << "Account is not valid"
      Result.new(false, nil, @errors.join(","))
    else
      account = Account.new(account_params)
      if account.save        
        Result.new(true, account)
       # Call the entity creation class
       CreateEntity.call(@payload, account.id)
      else
        @errors << account.errors.full_messages
        Result.new(false, nil, @errors.join(","))
      end
    end
  end

  def is_account_valid?
    return false if @payload.blank?

    true
  end

  def account_params
    if @from_fintera
      {
        name: @payload[:name_account],
        phone: @payload[:phone_account].to_s.gsub(/\D/, ""),
        active: true,
      }
    else
      {
        name: @payload[:name_account],
        phone: @payload[:phone_account].to_s.gsub(/\D/, ""),
        active: false,
      }
    end
  end
end

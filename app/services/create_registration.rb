class CreateRegistration < ApplicationService
  def initialize(payload)
    @payload = payload
  end

  def call
		#check number of partners
    @result = if @payload[:from_partner] == true && @payload[:many_partners] == true
			CreateAccountAndNotify.call(true)
			create_account
		elsif @payload[:from_partner] == true
			CreateAccountAndNotify.call(false)
			create_account
		else
			create_account
		end

    return Result.new(true, @result.data) if @result.success?

    @result
  end

	#checks if there is a fintera in the account name and passes the parameter to the CreateAccount class
  def create_account
    if @payload[:name_account].include?("Fintera")
      CreateAccount.call(@payload, true)
    else
      CreateAccount.call(@payload, false)
    end
  end

end

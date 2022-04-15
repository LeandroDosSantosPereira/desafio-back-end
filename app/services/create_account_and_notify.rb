class CreateAccountAndNotify < ApplicationService
  def initialize(data)
    @params = data
  end

  def call
    if @params == true
      NotifyPartner.new.perform
      NotifyPartner.new("another").perform      
    else
      NotifyPartner.new.perform      
    end
  end
end

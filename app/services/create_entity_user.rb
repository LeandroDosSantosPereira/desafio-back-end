class CreateEntityUser< ApplicationService
  def initialize(entity_user_params)
    @entity_user_params = entity_user_params
    @errors = []
  end

  def call
    if !is_param_valid?
      @errors << "The values ​​entered are not valid "
      Result.new(false, nil, @errors.join(","))
    else
      @entity_user = EntityUser.new(get_user_and_entity)    
      if @entity_user.save
        Result.new(true,  @entity_user)
      else
        @errors <<  @entity_user.errors.full_messages
          Result.new(false, nil, @errors.join(","))
      end
    end

  end

  def is_param_valid?
    return false if @entity_user_params.blank?

    true
  end
  
  def get_user_and_entity
    #get user by email
    @user = User.where(email:  @entity_user_params[:user_email] )
    #get  account by name 
    @account= Account.where(name:  @entity_user_params[:account_name] )  
    #get  entity by account_id 
    @entity = Entity.where(account_id: @account.first.id)    
    return params(@user.first.id, @entity.first.id)
  end

  #create user_entity JSON
  def params(user, entity)
    {
      user_id:  user,
      entity_id: entity
    }
    
  end
  
  

end

class CreateEntity< ApplicationService
  def initialize(entity_params ,account_id)
    @entity_params = entity_params
    @account_id = account_id
    @errors = []
  end

  def call
    @entity = Entity.new(entity_params)      
    if @entity.save
      Result.new(true,  @entity)
    else
      @errors <<  @entity.errors.full_messages
        Result.new(false, nil, @errors.join(","))
    end
  end

  def entity_params
    {     

      account_id: @account_id ,
      name:   @entity_params[:name_entity]
      
    }
  end


end

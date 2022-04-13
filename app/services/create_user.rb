class CreateUser< ApplicationService
  def initialize(user_params)
    @user_params = user_params
    @errors = []
  end

  def call
    @user = User.new(@user_params)
    @user[:phone] = @user[:phone].to_s.gsub(/\D/, "")
    if @user.save
      Result.new(true,  @user)
    else
      @errors <<  @user.errors.full_messages
        Result.new(false, nil, @errors.join(","))
    end
  end

end

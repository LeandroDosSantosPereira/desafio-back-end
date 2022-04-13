class CreateUser< ApplicationService
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    @user = User.new(@user_params)
    @user[:phone] = @user[:phone].to_s.gsub(/\D/, "")
    if @user.save
      p "Salvoooo!!!!!!!"
    else
      p "Erro!!!!!!!"
    end
  end

end

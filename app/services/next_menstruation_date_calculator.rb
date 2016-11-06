class NextMenstruationDateCalculator
  def initialize(user)
    @user = user
  end

  def calculate
    (@user.menstruation_date + @user.menstruation_days.days)
  end
end

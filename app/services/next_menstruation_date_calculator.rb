class NextMenstruationDateCalculator
  def initialize(user)
    @menstruation_date = user.menstruation_date
  end

  def calculate
    (@menstruation_date + 28.days).strftime('%d/%m')
  end
end

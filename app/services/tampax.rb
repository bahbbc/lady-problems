class Tampax
  RULES = [
    ['0-3', true, true, 'decrease', 'low', 'same'],
    ['0-3', true, true, 'decrease', 'moderate', 'increase'],
    ['0-3', true, true, 'decrease', 'high', 'increase'],
    ['0-3', true, true, 'decrease', 'high', 'increase'],
    ['0-3', true, true, 'same', 'low', 'increase'],
    ['0-3', true, true, 'same', 'moderate', 'increase'],
    ['0-3', true, true, 'same', 'high', 'increase'],
    ['0-3', true, true, 'same', 'high', 'increase'],
    ['0-3', true, true, 'increase', 'low', 'increase'],
    ['0-3', true, true, 'increase', 'moderate', 'increase'],
    ['0-3', true, true, 'increase', 'high', 'increase'],
    ['0-3', true, true, 'increase', 'high', 'increase'],
    ['>3', true, true, 'decrease', 'low', 'less'],
    ['>3', true, true, 'decrease', 'moderate', 'less'],
    ['>3', true, true, 'decrease', 'high', 'increase'],
    ['>3', true, true, 'decrease', 'high', 'increase'],
    ['>3', true, true, 'same', 'low', 'less'],
    ['>3', true, true, 'same', 'moderate', 'less'],
    ['>3', true, true, 'same', 'high', 'increase'],
    ['>3', true, true, 'same', 'high', 'increase'],
    ['>3', true, true, 'increase', 'low', 'increase'],
    ['>3', true, true, 'increase', 'moderate', 'increase'],
    ['>3', true, true, 'increase', 'high', 'increase'],
    ['>3', true, true, 'increase', 'high', 'increase'],
    ['0-3', true, false, 'decrease', 'low', 'same'],
    ['0-3', true, false, 'decrease', 'moderate', 'same'],
    ['0-3', true, false, 'decrease', 'high', 'increase'],
    ['0-3', true, false, 'decrease', 'high', 'increase'],
    ['0-3', true, false, 'same', 'low', 'increase'],
    ['0-3', true, false, 'same', 'moderate', 'increase'],
    ['0-3', true, false, 'same', 'high', 'increase'],
    ['0-3', true, false, 'same', 'high', 'increase'],
    ['0-3', true, false, 'increase', 'low', 'increase'],
    ['0-3', true, false, 'increase', 'moderate', 'increase'],
    ['0-3', true, false, 'increase', 'high', 'increase'],
    ['0-3', true, false, 'increase', 'high', 'increase'],
    ['>3', true, false, 'decrease', 'low', 'less'],
    ['>3', true, false, 'decrease', 'moderate', 'less'],
    ['>3', true, false, 'decrease', 'high', 'increase'],
    ['>3', true, false, 'decrease', 'high', 'increase'],
    ['>3', true, false, 'same', 'low', 'less'],
    ['>3', true, false, 'same', 'moderate', 'less'],
    ['>3', true, false, 'same', 'high', 'increase'],
    ['>3', true, false, 'same', 'high', 'increase'],
    ['>3', true, false, 'increase', 'low', 'increase'],
    ['>3', true, false, 'increase', 'moderate', 'increase'],
    ['>3', true, false, 'increase', 'high', 'increase'],
    ['>3', true, false, 'increase', 'high', 'increase'],
    ['0-3', false, true, 'decrease', 'low', 'decrease'],
    ['0-3', false, true, 'decrease', 'moderate', 'decrease'],
    ['0-3', false, true, 'decrease', 'high', 'same'],
    ['0-3', false, true, 'decrease', 'high', 'same'],
    ['0-3', false, true, 'same', 'low', 'decrease'],
    ['0-3', false, true, 'same', 'moderate', 'longer'],
    ['0-3', false, true, 'same', 'high', 'longer'],
    ['0-3', false, true, 'same', 'high', 'longer'],
    ['0-3', false, true, 'increase', 'low', 'decrease'],
    ['0-3', false, true, 'increase', 'moderate', 'longer'],
    ['0-3', false, true, 'increase', 'high', 'longer'],
    ['0-3', false, true, 'increase', 'high', 'longer'],
    ['>3', false, true, 'decrease', 'low', 'decrease'],
    ['>3', false, true, 'decrease', 'moderate', 'decrease'],
    ['>3', false, true, 'decrease', 'high', 'same'],
    ['>3', false, true, 'decrease', 'high', 'same'],
    ['>3', false, true, 'same', 'low', 'decrease'],
    ['>3', false, true, 'same', 'moderate', 'decrease'],
    ['>3', false, true, 'same', 'high', 'same'],
    ['>3', false, true, 'same', 'high', 'same'],
    ['>3', false, true, 'increase', 'low', 'same'],
    ['>3', false, true, 'increase', 'moderate', 'same'],
    ['>3', false, true, 'increase', 'high', 'same'],
    ['>3', false, true, 'increase', 'high', 'same'],
    ['0-3', false, false, 'decrease', 'low', 'decrease'],
    ['0-3', false, false, 'decrease', 'moderate', 'same'],
    ['0-3', false, false, 'decrease', 'high', 'same'],
    ['0-3', false, false, 'decrease', 'high', 'same'],
    ['0-3', false, false, 'same', 'low', 'same'],
    ['0-3', false, false, 'same', 'moderate', 'same'],
    ['0-3', false, false, 'same', 'high', 'same'],
    ['0-3', false, false, 'same', 'high', 'same'],
    ['0-3', false, false, 'increase', 'low', 'same'],
    ['0-3', false, false, 'increase', 'moderate', 'same'],
    ['0-3', false, false, 'increase', 'high', 'increase'],
    ['0-3', false, false, 'increase', 'high', 'increase'],
    ['>3', false, false, 'decrease', 'low', 'decrease'],
    ['>3', false, false, 'decrease', 'moderate', 'same'],
    ['>3', false, false, 'decrease', 'high', 'same'],
    ['>3', false, false, 'decrease', 'high', 'same'],
    ['>3', false, false, 'same', 'low', 'same'],
    ['>3', false, false, 'same', 'moderate', 'same'],
    ['>3', false, false, 'same', 'high', 'same'],
    ['>3', false, false, 'same', 'high', 'same'],
    ['>3', false, false, 'increase', 'low', 'same'],
    ['>3', false, false, 'increase', 'moderate', 'same'],
    ['>3', false, false, 'increase', 'high', 'increase'],
    ['>3', false, false, 'increase', 'high', 'increase']
  ]

  def initialize(user)
    @user = user
  end

  def build_message
    case find_recomendation
    when 'same'
      'Continue usando o mesmo nível de absorção na sua próxima troca.'
    when 'longer'
      'Continue usando o mesmo nível de absorção na sua próxima troca,'\
      ' mas use-o por mais de 3 horas (e menos de 8h) para diminuir o desconforto na hora da remoção.'
    when 'less'
      'Continue usando o mesmo nível de absorção na sua próxima troca,'\
      ' mas use-o por menos de 3 horas para que não haja mais vazamentos.'
    when 'decrease'
      decrease_message
    when 'increase'
      increase_message
    else
      'Não sei, desculpa ):'
    end
  end

  private

  def find_recomendation
    RULES.detect do |rule|
      @user.hours_wering_tampon == rule[0] &&
        @user.tampon_leak == rule[1] &&
        @user.disconfort_during_removal == rule[2] &&
        @user.flow == rule[3] &&
        @user.activity_level == rule[4]
    end[4]
  end

  def increase_message
    case @user.tampon_absorbency_type
    when 'lite'
      'Mude o seu absorvente para o tamanho regular para maior conforto.'
    when 'regular'
      'Mude o seu absorvente para o tamanho super para maior conforto.'
    when 'super'
      'Mude o seu absorvente para o tamanho lite para maior conforto.'
    else
      'Não sei, desculpa ):'
    end
  end

  def decrease_message
    case @user.tampon_absorbency_type
    when 'lite'
      'Mude o seu absorvente para o tamanho super para maior conforto.'
    when 'regular'
      'Mude o seu absorvente para o tamanho lite para maior conforto.'
    when 'super'
      'Mude o seu absorvente para o tamanho regular para maior conforto.'
    else
      'Não sei, desculpa ):'
    end
  end
end

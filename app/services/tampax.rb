class Tampax
  RULES = [
    ['0-3', 'yes', 'yes', 'decrease', 'low', 'same'],
    ['0-3', 'yes', 'yes', 'decrease', 'moderate', 'increase'],
    ['0-3', 'yes', 'yes', 'decrease', 'high', 'increase'],
    ['0-3', 'yes', 'yes', 'decrease', 'sleep', 'increase'],
    ['0-3', 'yes', 'yes', 'same', 'low', 'increase'],
    ['0-3', 'yes', 'yes', 'same', 'moderate', 'increase'],
    ['0-3', 'yes', 'yes', 'same', 'high', 'increase'],
    ['0-3', 'yes', 'yes', 'same', 'sleep', 'increase'],
    ['0-3', 'yes', 'yes', 'increase', 'low', 'increase'],
    ['0-3', 'yes', 'yes', 'increase', 'moderate', 'increase'],
    ['0-3', 'yes', 'yes', 'increase', 'high', 'increase'],
    ['0-3', 'yes', 'yes', 'increase', 'sleep', 'increase'],
    ['>3', 'yes', 'yes', 'decrease', 'low', 'less'],
    ['>3', 'yes', 'yes', 'decrease', 'moderate', 'less'],
    ['>3', 'yes', 'yes', 'decrease', 'high', 'increase'],
    ['>3', 'yes', 'yes', 'decrease', 'sleep', 'increase'],
    ['>3', 'yes', 'yes', 'same', 'low', 'less'],
    ['>3', 'yes', 'yes', 'same', 'moderate', 'less'],
    ['>3', 'yes', 'yes', 'same', 'high', 'increase'],
    ['>3', 'yes', 'yes', 'same', 'sleep', 'increase'],
    ['>3', 'yes', 'yes', 'increase', 'low', 'increase'],
    ['>3', 'yes', 'yes', 'increase', 'moderate', 'increase'],
    ['>3', 'yes', 'yes', 'increase', 'high', 'increase'],
    ['>3', 'yes', 'yes', 'increase', 'sleep', 'increase'],
    ['0-3', 'yes', 'no', 'decrease', 'low', 'same'],
    ['0-3', 'yes', 'no', 'decrease', 'moderate', 'same'],
    ['0-3', 'yes', 'no', 'decrease', 'high', 'increase'],
    ['0-3', 'yes', 'no', 'decrease', 'sleep', 'increase'],
    ['0-3', 'yes', 'no', 'same', 'low', 'increase'],
    ['0-3', 'yes', 'no', 'same', 'moderate', 'increase'],
    ['0-3', 'yes', 'no', 'same', 'high', 'increase'],
    ['0-3', 'yes', 'no', 'same', 'sleep', 'increase'],
    ['0-3', 'yes', 'no', 'increase', 'low', 'increase'],
    ['0-3', 'yes', 'no', 'increase', 'moderate', 'increase'],
    ['0-3', 'yes', 'no', 'increase', 'high', 'increase'],
    ['0-3', 'yes', 'no', 'increase', 'sleep', 'increase'],
    ['>3', 'yes', 'no', 'decrease', 'low', 'less'],
    ['>3', 'yes', 'no', 'decrease', 'moderate', 'less'],
    ['>3', 'yes', 'no', 'decrease', 'high', 'increase'],
    ['>3', 'yes', 'no', 'decrease', 'sleep', 'increase'],
    ['>3', 'yes', 'no', 'same', 'low', 'less'],
    ['>3', 'yes', 'no', 'same', 'moderate', 'less'],
    ['>3', 'yes', 'no', 'same', 'high', 'increase'],
    ['>3', 'yes', 'no', 'same', 'sleep', 'increase'],
    ['>3', 'yes', 'no', 'increase', 'low', 'increase'],
    ['>3', 'yes', 'no', 'increase', 'moderate', 'increase'],
    ['>3', 'yes', 'no', 'increase', 'high', 'increase'],
    ['>3', 'yes', 'no', 'increase', 'sleep', 'increase'],
    ['0-3', 'no', 'yes', 'decrease', 'low', 'decrease'],
    ['0-3', 'no', 'yes', 'decrease', 'moderate', 'decrease'],
    ['0-3', 'no', 'yes', 'decrease', 'high', 'same'],
    ['0-3', 'no', 'yes', 'decrease', 'sleep', 'same'],
    ['0-3', 'no', 'yes', 'same', 'low', 'decrease'],
    ['0-3', 'no', 'yes', 'same', 'moderate', 'longer'],
    ['0-3', 'no', 'yes', 'same', 'high', 'longer'],
    ['0-3', 'no', 'yes', 'same', 'sleep', 'longer'],
    ['0-3', 'no', 'yes', 'increase', 'low', 'decrease'],
    ['0-3', 'no', 'yes', 'increase', 'moderate', 'longer'],
    ['0-3', 'no', 'yes', 'increase', 'high', 'longer'],
    ['0-3', 'no', 'yes', 'increase', 'sleep', 'longer'],
    ['>3', 'no', 'yes', 'decrease', 'low', 'decrease'],
    ['>3', 'no', 'yes', 'decrease', 'moderate', 'decrease'],
    ['>3', 'no', 'yes', 'decrease', 'high', 'same'],
    ['>3', 'no', 'yes', 'decrease', 'sleep', 'same'],
    ['>3', 'no', 'yes', 'same', 'low', 'decrease'],
    ['>3', 'no', 'yes', 'same', 'moderate', 'decrease'],
    ['>3', 'no', 'yes', 'same', 'high', 'same'],
    ['>3', 'no', 'yes', 'same', 'sleep', 'same'],
    ['>3', 'no', 'yes', 'increase', 'low', 'same'],
    ['>3', 'no', 'yes', 'increase', 'moderate', 'same'],
    ['>3', 'no', 'yes', 'increase', 'high', 'same'],
    ['>3', 'no', 'yes', 'increase', 'sleep', 'same'],
    ['0-3', 'no', 'no', 'decrease', 'low', 'decrease'],
    ['0-3', 'no', 'no', 'decrease', 'moderate', 'same'],
    ['0-3', 'no', 'no', 'decrease', 'high', 'same'],
    ['0-3', 'no', 'no', 'decrease', 'sleep', 'same'],
    ['0-3', 'no', 'no', 'same', 'low', 'same'],
    ['0-3', 'no', 'no', 'same', 'moderate', 'same'],
    ['0-3', 'no', 'no', 'same', 'high', 'same'],
    ['0-3', 'no', 'no', 'same', 'sleep', 'same'],
    ['0-3', 'no', 'no', 'increase', 'low', 'same'],
    ['0-3', 'no', 'no', 'increase', 'moderate', 'same'],
    ['0-3', 'no', 'no', 'increase', 'high', 'increase'],
    ['0-3', 'no', 'no', 'increase', 'sleep', 'increase'],
    ['>3', 'no', 'no', 'decrease', 'low', 'decrease'],
    ['>3', 'no', 'no', 'decrease', 'moderate', 'same'],
    ['>3', 'no', 'no', 'decrease', 'high', 'same'],
    ['>3', 'no', 'no', 'decrease', 'sleep', 'same'],
    ['>3', 'no', 'no', 'same', 'low', 'same'],
    ['>3', 'no', 'no', 'same', 'moderate', 'same'],
    ['>3', 'no', 'no', 'same', 'high', 'same'],
    ['>3', 'no', 'no', 'same', 'sleep', 'same'],
    ['>3', 'no', 'no', 'increase', 'low', 'same'],
    ['>3', 'no', 'no', 'increase', 'moderate', 'same'],
    ['>3', 'no', 'no', 'increase', 'high', 'increase'],
    ['>3', 'no', 'no', 'increase', 'sleep', 'increase'],
  ]

  def intialize(user)
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
      descrease_message
    when 'increase'
      increase_message
    end
  end

  private

  def descrease_message
    case @user.tampon_absorbency_type
    when 'lite'
      'Mude o seu absorvente para o tamanho regular para maior conforto.'
    when 'regular'
      'Mude o seu absorvente para o tamanho super para maior conforto.'
    when 'super'
      'Mude o seu absorvente para o tamanho super plus para maior conforto.'
    else
      'Mude o seu absorvente para o tamanho lite para maior conforto.'
      end
  end

  def increase_message
    case @user.tampon_absorbency_type
    when 'lite'
      'Mude o seu absorvente para o tamanho ultra para maior conforto.'
    when 'regular'
      'Mude o seu absorvente para o tamanho lite para maior conforto.'
    when 'super'
      'Mude o seu absorvente para o tamanho regular para maior conforto.'
    else
      'Mude o seu absorvente para o tamanho super plus para maior conforto.'
    end
  end
end



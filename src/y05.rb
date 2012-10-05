p ->() {

  class IMonad
    def bind(value, &block)
      yield(value)
    end

    def result(value)
      value
    end

    def call(value, &block)
      bind(value, &block)
    end
  end

  class MaybeMonad < IMonad
    def bind(value, &block)
      value.nil? ? nil : yield(value)
    end
  end

  class SequenceMonad < IMonad
    def bind(values, &block)
      values.map { |value| yield(value) }.flatten
    end
    def result(value)
      [value]
    end
  end

  m = SequenceMonad.new
  m.(0...5) { |a|
    m.(0...a) { |b|
      m.result(a + b)
    }
  }

}.()

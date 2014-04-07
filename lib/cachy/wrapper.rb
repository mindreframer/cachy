class Cachy::Wrapper
  attr_accessor :wrapped
  def initialize(wrapped)
    @wrapped = wrapped
  end

  def read(key)
    @wrapped[key]
  end

  def method_missing(name, args=nil)
    @wrapped.send(name, *args)
  end

  def respond_to?(x)
    super(x) || @wrapped.respond_to?(x)
  end
end

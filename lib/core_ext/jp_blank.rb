class Object
  alias_method :jp_blank?, :blank?
end
 
class NilClass
  alias_method :jp_blank?, :blank?
end
 
class FalseClass
  alias_method :jp_blank?, :blank?
end
 
class TrueClass
  alias_method :jp_blank?, :blank?
end
 
class Array
  alias_method :jp_blank?, :blank?
end
 
class Hash
  alias_method :jp_blank?, :blank?
end
 
class Numeric
  alias_method :jp_blank?, :blank?
end
 
class String
  def jp_blank?
    !!(self =~ /\A[\s　]*\z/)
  end
end


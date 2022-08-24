class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |method|
      define_method(method) { self.instance_variable_get("@#{method}") }
      define_method("#{method}=") {|val| self.instance_variable_set("@#{method}", val)}
    end

  end
end

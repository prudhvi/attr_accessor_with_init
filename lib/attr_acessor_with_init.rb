require "attr_acessor_with_init/version"

module AttrAcessorWithInit
  def attr_with_init(*args)
    attr_accessor *args

    self.class_eval do
      define_method(:initialize) do |options|
        args.each do |arg|
          instance_variable_set("@#{arg}", options[arg])
        end
      end
    end
  end
end

class Module
  include AttrAcessorWithInit
end

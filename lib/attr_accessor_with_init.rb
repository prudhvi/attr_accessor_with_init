require "attr_accessor_with_init/version"

class MultipleUsageException < StandardError; end

module AttrAccessorWithInit
  def attr_with_init(*args)
    raise MultipleUsageException, "You can use only once #{__method__.to_s} only once per class" if @method_definition
    @method_definition ||= begin
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
end

class Module
  include AttrAccessorWithInit
end

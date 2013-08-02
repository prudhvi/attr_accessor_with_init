require 'attr_accessor_with_init'

describe AttrAccessorWithInit do
  describe '#attr_with_init' do
    it "should be available as a class method on any class" do
      klass = Class.new
      klass.should respond_to(:attr_with_init)
    end

    context "When used inside a class" do
      before :each do
        class A
        end
      end
      it "should call the attr_accessor method to create getters and setters" do
        expect(A).to receive(:attr_accessor) { :hello }
        A.send(:attr_with_init, :hello)
      end
    end
  end
end
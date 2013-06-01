class MaxiTest::Assertions
  class << self
    def have_assert?(name)
      File.exists?(assert_class_path(name))
      p assert_class_path(name)
    end

    def run(name, *args)
      klass = "#{self.name}::#{name.to_s.camelize}"

      require assert_class_path(name)

      assert = klass.constantize.new

      assert.exec(*args)

      assert
    end

    private

    def assert_class_path(name)
      File.expand_path("../assertions/#{name}.rb", __FILE__)
    end
  end
end

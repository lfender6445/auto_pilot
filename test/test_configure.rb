require_relative 'helper'

class TestConfigure < MiniTest::Test
  def setup
    @subject = AutoPilot
  end

  def test_configuration
    @subject.configure do |config|
      config.foo = 'bar'
    end
    assert_equal @subject.configuration.foo, 'bar'
    assert_equal @subject.configuration.to_hash, {:user=>"lfender6445", :format=>[:md, :html], :folder=>"test/stackoverflow", :disable_front_matter=>false, :max_pages=>2, :foo=>"bar"}
    assert_equal @subject.configuration.keys, [:user, :format, :folder, :disable_front_matter, :max_pages, :foo]
    # assert_equal @subject.configuration.update({foo: :baz}), ''
  end
end


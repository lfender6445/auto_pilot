require_relative 'helper'

class TestConfigure < MiniTest::Test
  def setup
    configure
    @subject = AutoPilot
  end

  def test_configuration
    @subject.configure do |config|
      config.foo = 'bar'
    end
    assert_equal @subject.configuration.foo, 'bar'

    assert_equal @subject.configuration.user, 'foo'
    assert_equal @subject.configuration.format, [:md, :html]
    assert_equal @subject.configuration.folder, 'test/stackoverflow'
    assert_equal @subject.configuration.disable_front_matter, false
    assert_equal @subject.configuration.max_pages, 2
    assert_equal @subject.configuration.key, nil
    assert_equal @subject.configuration.throttle, 3
  end
end


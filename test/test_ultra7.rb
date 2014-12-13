# coding: utf-8
$: << 'lib'
require 'minitest/autorun'
require 'ultra7'
require 'ultra7/mime'

class TestUltra7 < MiniTest::Unit::TestCase

  def setup
    @klass = Class.new do
      include Ultra7::MIME
    end
  end

  def teardown
    @klass = nil
  end

  def test_decode_utf7
    assert_equal 'Hello, identity', 
                 Ultra7::MIME.decode_utf7('Hello, identity')

    assert_equal '1 + 1 = 2', 
                 Ultra7::MIME.decode_utf7('1 +- 1 = 2')

    assert_equal 'Hello, 日本語', 
                 Ultra7::MIME.decode_utf7('Hello, +ZeVnLIqe-')
    
    assert_equal 'Hello, 日本語', 
                 Ultra7::MIME.decode_utf7('Hello, +ZeVnLIqe-', 
                                          encoding: 'utf-8')
  
    assert_raises ArgumentError do
      Ultra7::MIME.decode_utf7('Hello, +ZeVnLIqe-', 
                               encoding: 'foobar')
    end
  end

  def test_mixin
    assert_equal 'Hello, identity', 
                 @klass.decode_utf7('Hello, identity')

    assert_equal '1 + 1 = 2', 
                 @klass.decode_utf7('1 +- 1 = 2')

    assert_equal 'Hello, 日本語', 
                 @klass.decode_utf7('Hello, +ZeVnLIqe-')
    
    assert_equal 'Hello, 日本語', 
                 @klass.decode_utf7('Hello, +ZeVnLIqe-', 
                                    encoding: 'utf-8')

    assert_raises ArgumentError do
      @klass.decode_utf7('Hello, +ZeVnLIqe-', encoding: 'foobar')
    end
  end
end


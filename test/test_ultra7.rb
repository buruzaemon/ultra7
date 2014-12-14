# coding: utf-8
$: << 'lib'
require 'minitest/autorun'
require 'ultra7'
require 'ultra7/mime'

class TestUltra7 < MiniTest::Unit::TestCase
  ID    = 'Hello, identity'

  TEXT1 = '1 +- 1 = 2'
  EXP1  = '1 + 1 = 2' 

  TEXT2 = 'Hello, +ZeVnLIqe-'
  EXP2  = 'Hello, 日本語' 

  TEXT3 = '=?utf-7?Q?RE: +AFs-Bug 3605+AF0- rewrite+AF8-header will not rewrite a missing header?='
  EXP3  = 'RE: [Bug 3605] rewrite_header will not rewrite a missing header'

  TEXT4 = '=?unicode-1-1-utf-7?Q?+vDCy7A-  +wMHQ3A-  +xUy5vA-(+wuTTKA-)?='
  EXP4  = '배달  상태  알림(실패)' 

  TEXT5 = '=?utf-7?Q?+vDCy7A-  +wMHQ3A-?= hello =?utf-7?Q?+xUy5vA-(+wuTTKA-)?='
  EXP5  = '배달  상태 hello 알림(실패)'.encode(Encoding.find('EUC-KR')) 


  def setup
    @klass = Class.new do
      include Ultra7::MIME
    end
  end

  def teardown
    @klass = nil
  end

  def test_decode_utf7
    assert_equal ID, Ultra7::MIME.decode_utf7(ID)

    assert_equal EXP1, 
                 Ultra7::MIME.decode_utf7(TEXT1)

    assert_equal EXP2,
                 Ultra7::MIME.decode_utf7(TEXT2)
    
    assert_equal EXP3,
                 Ultra7::MIME.decode_utf7(TEXT3)
  
    assert_equal EXP4,
                 Ultra7::MIME.decode_utf7(TEXT4, encoding: 'UTF-8')
  
    assert_equal EXP5,
                 Ultra7::MIME.decode_utf7(TEXT5, encoding: 'EUC-KR')
  
    assert_raises ArgumentError do
      Ultra7::MIME.decode_utf7(TEXT2, encoding: 'foobar')
    end
  end

  def test_mixin
    assert_equal ID, @klass.decode_utf7(ID)

    assert_equal EXP1, 
                 @klass.decode_utf7(TEXT1)

    assert_equal EXP2,
                 @klass.decode_utf7(TEXT2)
  
    assert_equal EXP3,
                 @klass.decode_utf7(TEXT3)
  
    assert_equal EXP4,
                 @klass.decode_utf7(TEXT4, encoding: 'UTF-8')
  
    assert_equal EXP5,
                 @klass.decode_utf7(TEXT5, encoding: 'EUC-KR')

    assert_raises ArgumentError do
      @klass.decode_utf7(TEXT2, encoding: 'foobar')
    end
  end
end

# Copyright (c) 2014-2015, Brooke M. Fujita.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#  * Redistributions of source code must retain the above
#    copyright notice, this list of conditions and the
#    following disclaimer.
# 
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the
#    following disclaimer in the documentation and/or other
#    materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

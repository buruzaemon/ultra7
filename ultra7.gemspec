# coding: utf-8
$:.unshift('lib')
require 'ultra7/version'

Gem::Specification.new do |s|
  s.name = 'ultra7'
  s.version = Ultra7::VERSION
  s.license = 'BSD'
  s.summary = 'A UTF-7 MIME decoder, plain and simple.'
  s.description = <<END_DESC
ultra7 decodes UTF-7 in the context of MIME headers (c.f. https://tools.ietf.org/html/rfc2152).
END_DESC
  s.author = 'Brooke M. Fujita'
  s.email = 'buruzaemon@gmail.com'
  s.homepage = 'https://bitbucket.org/buruzaemon/ultra7'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9'
  s.require_path = 'lib'
  s.files = [
    'lib/ultra7.rb', 
    'lib/ultra7/version.rb', 
    'README.md',
    'LICENSE', 
    'CHANGELOG',
    '.yardopts'
  ]
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

# coding: utf-8
module Ultra7

  module MIME

    # @private
    def self.included(base)
      base.extend(ClassMethods)
    end

    # Returns the decoded value for the given
    # UTF-7 encoded `text`. If the optional
    # `encoding` value is not specified, then
    # the resulting string will use the default
    # `Encoding.default_external` encoding.
    #
    # @param [String] UTF-7 encoded text
    # @param [Hash] options
    # @return UTF-7 decoded value
    # @raise [ArgumentError] if the given `encoding` cannot be found
    def self.decode_utf7(text, options={})
      enc = options[:encoding].nil? \
        ? Encoding.default_external \
        : Encoding.find(options[:encoding])
      
      return text.gsub(/\+(.*?)-/n) {
        if $1.empty?
          "+"
        else
          base64 = $1
          pad = base64.length % 4
          if pad > 0
            base64 << ("=" * (4-pad))
          end
          base64.unpack("m").first.unpack("n*").pack("U*")
        end
      }.encode(enc)
    end

    # @private
    module ClassMethods
      def decode_utf7(text, options={})
        Ultra7::MIME.decode_utf7(text, options)
      end
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
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

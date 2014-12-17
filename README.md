# Ultra7
A UTF-7 MIME header decoder, plain and simple.

## What is Ultra7?

* Ultra7 is a UTF-7 decoder for MIME message headers, per the [MIME encoded word syntax of RFC-2047](http://tools.ietf.org/html/rfc2047),
* It is almost unlike [`Net::IMAP.decode_utf7`](http://ruby-doc.org/stdlib-2.0.0/libdoc/net/imap/rdoc/Net/IMAP.html#method-c-decode_utf7), which is meant for decoding mailbox names. 
* `Ultra7::MIME` is also a mixin, so you can conveniently combine it in another class by using
`include`.
* Read the [API documentation](http://www.rubydoc.info/gems/ultra7).
* Learn more about [Ultra7 at bitbucket](https://bitbucket.org/buruzaemon/ultra7/).


## Requirements

* Ultra7 does not really require anything, except a Ruby of _1.9 or greater_.


## Installation

* Install Ultra7 with the following gem command:

        gem install ultra7


## Usage

* Using Ultra7 is pretty straight-forward, really. It _only_ decodes UTF-7.

        require 'ultra7'
    
        # just call decode_utf7
        puts Ultra7::MIME.decode_utf7('1 +- 1 = 2')
        => "1 + 1 = 2"
    
        # Decodes UTF-7, returning string with default encoding
        puts Ultra7::MIME.decode_utf7('Hello, +ZeVnLIqe-')
        => "Hello, 日本語"
    
        # Decodes an actual Subject MIME header in UTF-7,
        # returning string with explicit UTF-8 encoding
        subject = '=?unicode-1-1-utf-7?Q?+vDCy7A-  +wMHQ3A-  +xUy5vA-(+wuTTKA-)?='
        Ultra7::MIME.decode_utf7(subject, encoding: 'UTF-8')
        => "배달  상태  알림(실패)"

    
* And you can use `Ultra7::MIME` as a mixin.
    
        # As a mixin to another class
        require 'ultra7/mime'
        class Foo
          include Ultra7::MIME
        end
    
        puts Foo.decode_utf7('Hi Mom -+Jjo--!')
        => "Hi Mom -☺-!" 


## Learn more 
- You can read more about UTF-7, A Mail-Safe Transformation Format of Unicode [RFC2152](https://tools.ietf.org/html/rfc2152).
- Contrast with
  [`Net::IMAP.decode_utf7`](http://ruby-doc.org/stdlib-1.9.3/libdoc/net/imap/rdoc/Net/IMAP.html#method-c-decode_utf7).

## Contributing to natto
-  Use [mercurial](http://mercurial.selenic.com/) and [check out the latest code at bitbucket](https://bitbucket.org/buruzaemon/ultra7/src/) to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
-  [Browse the issue tracker](https://bitbucket.org/buruzaemon/ultra7/issues/) to make sure someone already hasn't requested it and/or contributed it.
-  Fork the project.
-  Start a feature/bugfix branch.
-  Commit and push until you are happy with your contribution.
-  Make sure to add tests for it. This is important so I don't break it in a future version unintentionally. I use [MiniTest::Unit](http://rubydoc.info/gems/minitest/MiniTest/Unit) as it is very natural and easy-to-use.
-  Please try not to mess with the Rakefile, CHANGELOG, or version. If you must have your own version, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Changelog
Please see the {file:CHANGELOG} for this gem's release history.

## Copyright
Copyright &copy; 2014-2015, Brooke M. Fujita. All rights reserved. Please see the {file:LICENSE} file for further details.
encode-for-mediasource
==================

Encodes a video file so that it can be played as a MediaSource in the browser. Installs ffmpeg and bento, then runs the appropriate commands with them.

Installation
------------

First, make sure you have `wget` and Homebrew. Then, clone this repo. Run:

    make install-mac

TODO: Linux

Usage
-----

    cd encode-for-mediasource
    make encode src=some-video.mp4 dst=encoded-video.mp4

Then, to get your codec MIME strings:

    make get-codec-mime src=encoded-video.mp4

Output:

    Codecs String: avc1.42C01E
    Codecs String: mp4a.40.2

You can then use these two codec strings (e.g. `video/mp4; codecs="avc1.42c01E,mp4a.40.2"`) when you call `addSourceBuffer` on the MediaSource.

License
-------

The MIT License (MIT)

Copyright (c) 2015 President and Fellows of Harvard College

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

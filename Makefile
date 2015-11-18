BENTOPATH = lib/Bento4-SDK-1-4-3-603.universal-apple-macosx

lib/Bento4-SDK-1-4-3-603.universal-apple-macosx:
	cd lib && \
	wget http://zebulon.bok.net/Bento4/binaries/Bento4-SDK-1-4-3-603.universal-apple-macosx.zip && \
	unzip Bento4-SDK-1-4-3-603.universal-apple-macosx.zip

lib/ffmpeg:
	brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265

install-mac: lib/Bento4-SDK-1-4-3-603.universal-apple-macosx lib/ffmpeg

encode:
	ffmpeg \
		-i $(src) \
		-c:v libx264 \
		-c:a libfdk_aac \
		-profile:v baseline \
		-level 3.0 \
		tmp/encoded.mp4 && \
	$(BENTOPATH)/bin/mp4fragment tmp/encoded.mp4 $(dst) && \
	rm tmp/encoded.mp4

get-codec-mime:
	$(BENTOPATH)/bin/mp4info $(src) | grep Codecs

pushall:
	git push origin master

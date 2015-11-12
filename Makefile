BENTOPATH = lib/Bento4-SDK-1-4-3-603.universal-apple-macosx

lib/Bento4-SDK-1-4-3-603.universal-apple-macosx:
	cd lib && \
	wget http://zebulon.bok.net/Bento4/binaries/Bento4-SDK-1-4-3-603.universal-apple-macosx.zip && \
	unzip Bento4-SDK-1-4-3-603.universal-apple-macosx.zip

lib/ffmpeg:
	cd lib && \
	wget http://ffmpegmac.net/resources/SnowLeopard_Lion_Mountain_Lion_Mavericks_Yosemite_El-Captain_27.10.2015.zip && \
	unzip SnowLeopard_Lion_Mountain_Lion_Mavericks_Yosemite_El-Captain_27.10.2015.zip

install-mac: lib/Bento4-SDK-1-4-3-603.universal-apple-macosx lib/ffmpeg

encode:
	ffmpeg \
		-i $(src) \
		-c:v libx264 \
		-c:a libvo_aacenc \
		-profile:v baseline \
		-level:v 3.0 \
		-r 25 \
		-keyint_min 250 \
		-strict experimental \
		-b:a 96k \
		-movflags faststart \
		tmp/encoded.mp4 && \
	$(BENTOPATH)/bin/mp4fragment tmp/encoded.mp4 $(dst) && \
	rm tmp/encoded.mp4

get-codec-mime:
	$(BENTOPATH)/bin/mp4info $(src) | grep Codecs

pushall:
	git push origin master

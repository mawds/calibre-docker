FROM resin/rpi-raspbian:stretch

MAINTAINER David Mawdsley

# From https://www.mobileread.com/forums/showthread.php?t=287233&page=2
# with additional packages 
RUN apt-get update && apt-get -y install zlib1g bzip2 expat sqlite libffi6 openssl ncurses-bin ncurses-base readline-common python python-setuptools python-six python-cssutils python-dateutil python-dnspython python-mechanize python-regex python-chardet python-msgpack python-pygments python-pycryptopp python-apsw libicu57  nasm cmake libjpeg-turbo-progs libpng-tools libwebp6 libjxr-tools libfreetype6 fontconfig python-libxml2 python-libxslt1 python-lxml python-webencodings python-html5lib python-pillow python-netifaces python-psutil python-chm python-poppler libgpg-error0 libgcrypt20 libglib2.0-0 python-dbus libdbus-1-3 dbus python-pyqt5 python-sip python-pyqt5.qtwebkit optipng libusb-1.0-0 libmtp-common pkg-config qt5-qmake qt5-default pyqt5-dev libglib2.0-dev python-fontconfig libfontconfig1-dev g++ python-dev libssl-dev libicu-dev libsqlite3-dev libchm-dev libpodofo-dev python-sip-dev qtbase5-private-dev libusb-1.0-0-dev libmtp-dev libmtdev-dev libxml2-dev libxslt1-dev python-pip pyqt4-dev-tools libqt4-dev-bin make


RUN pip install wheel
RUN pip install html5_parser
# Need a newer version of mechanize than installed for some
# recipes, e.g. lrb_payed
RUN pip install mechanize --upgrade
# Download, compile, install and remove source
RUN curl -L https://calibre-ebook.com/dist/src | tar xvJ && cd calibre* && python2 setup.py install && cd ..  && rm -r calibre-3*/
 

DESTDIR ?= /usr/local

BINDIR ?= $(DESTDIR)/bin
SHARDIR ?= $(DESTDIR)/share
ETCDIR ?= /etc
CACHEDIR ?= /var/cache

PKGNAME=ipchangerd

CONFDIR ?= $(ETCDIR)/$(PKGNAME).d

all: install

install-bin:

	install -D --group=root --mode=755 --owner=root \
		bin/$(PKGNAME) $(BINDIR)/$(PKGNAME)

	install -d --group=nogroup --mode=755 --owner=nobody \
		$(CACHEDIR)/$(PKGNAME)

install-conf:

	install -D --group=root --mode=644 --owner=root \
		etc/$(PKGNAME).conf $(ETCDIR)/$(PKGNAME).conf

	install -d --group=root --mode=755 --owner=root \
		$(CONFDIR)/ip-up.d

	install -d --group=root --mode=755 --owner=root \
		$(CONFDIR)/ip-down.d

install: install-bin install-conf

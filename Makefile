.PHONY: test

# Configurable by the make invocation.  Only DESTDIR should need
# changing.
DESTDIR =
INSTALL = install

test:
	cd testsuite && sh run.sh

install:
	$(INSTALL) -d $(DESTDIR)/var/lib/debsecan
	$(INSTALL) -d $(DESTDIR)/usr/share/debsecan/
	$(INSTALL) -D -m 0644 src/debsecan_lib/bullseye $(DESTDIR)/usr/share/debsecan/bullseye
	$(INSTALL) -D -m 0644 src/debsecan_lib/buster $(DESTDIR)/usr/share/debsecan/buster
	$(INSTALL) -D -m 0644 src/debsecan_lib/GENERIC $(DESTDIR)/usr/share/debsecan/GENERIC
	$(INSTALL) -D -m 0644 src/debsecan_lib/sid $(DESTDIR)/usr/share/debsecan/sid
	$(INSTALL) -D -m 0644 src/debsecan_lib/stretch $(DESTDIR)/usr/share/debsecan/stretch
	$(INSTALL) -D -m 0755 src/debsecan \
		$(DESTDIR)/usr/bin/debsecan
	$(INSTALL) -D -m 0755 src/debsecan-create-cron \
		$(DESTDIR)/usr/sbin/debsecan-create-cron
	$(INSTALL) -D -m 0755 doc/debsecan.1 \
		$(DESTDIR)/usr/share/man/man1/debsecan.1
	$(INSTALL) -D -m 0755 doc/debsecan-create-cron.8 \
		$(DESTDIR)/usr/share/man/man8/debsecan-create-cron.8
clean:
	-rm -f testsuite/*/*.out testsuite/whitelist.test testsuite/whitelist.exp

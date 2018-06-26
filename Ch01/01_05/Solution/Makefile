INSPEC=/usr/local/bin/inspec
VAGRANT=/usr/local/bin/vagrant

all :
	$(VAGRANT) destroy --force > /dev/null
	$(VAGRANT) up > /dev/null
	$(INSPEC) exec ./Inspec -t ssh://vagrant:vagrant@192.168.0.3
	$(VAGRANT) destroy --force > /dev/null

clean :
	$(VAGRANT) destroy --force > /dev/null

.PHONY: all clean

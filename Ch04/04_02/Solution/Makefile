INSPEC=/usr/local/bin/inspec

all :
	vagrant destroy --force > /dev/null
	vagrant up > /dev/null
	$(INSPEC) exec ./Inspec -t ssh://vagrant:vagrant@192.168.0.3
	vagrant destroy --force > /dev/null

clean :
	vagrant destroy --force > /dev/null

.PHONY: all clean

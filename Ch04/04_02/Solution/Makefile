INSPEC=/usr/local/bin/inspec

all :
	vagrant destroy --force
	vagrant up
	$(INSPEC) exec ./Inspec -t ssh://vagrant:vagrant@192.168.0.3
	vagrant destroy --force

clean :
	vagrant destroy --force

.PHONY: all clean

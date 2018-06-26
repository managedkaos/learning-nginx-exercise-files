INSPEC=/usr/local/bin/inspec
SOLUTIONS:=$(shell find . -type d -name Solution)

all : $(SOLUTIONS)

$(SOLUTIONS):
	$(MAKE) -C $@ $(TARGET)

.PHONY: all $(SOLUTIONS)

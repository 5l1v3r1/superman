ifeq ($(KERNELRELEASE),)

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
INSTALL_MOD_DIR ?= kernel/net/superman
PWD := $(shell pwd)

.PHONY: build clean

build:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
	$(call cmd_depmod)

uninstall:
	rm -f ${INSTALL_MOD_PATH}/lib/modules/${KVER}/${INSTALL_MOD_DIR}/superman.ko;
	$(call cmd_depmod)

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -f ../src/*.o

else

OBJS=$(patsubst %.c,%.o,$(shell cd $(M); find ../src/ -name '*.c'))

$(info Building SUPERMAN kernel module for kernel version ${KERNELRELEASE})

obj-m := superman.o
superman-y := $(OBJS)

endif

CONFIG_FILE = ./config.scm
HOSTS = <your hosts here>
USERS = <your users here>
GLP = ./:$(GUILE_LOAD_PATH)

targets-home = $(foreach host,$(HOSTS),$(foreach user, $(USERS),$(addsuffix -home,$(user)-$(host))))
targets-system = $(addsuffix -system, $(HOSTS))

%-home-build:
	GUILE_LOAD_PATH=$(GLP) MAGI_TARGET=home-$* \
	guix home build $(CONFIG_FILE)

%-home-reconfigure:
	GUILE_LOAD_PATH=$(GLP) MAGI_TARGET=home-$* \
	guix home reconfigure $(CONFIG_FILE)

%-system-build:
	GUILE_LOAD_PATH=$(GLP) MAGI_TARGET=system-$* \
	guix system build $(CONFIG_FILE)

%-system-reconfigure:
	GUILE_LOAD_PATH=$(GLP) MAGI_TARGET=system-$* \
	guix system build $(CONFIG_FILE)

$(targets-home): %-home-reconfigure
$(targets-system): %-system-reconfigure

.PHONY: help

help:
	$(info The targets are '$(targets-home)' and '$(targets-system)')

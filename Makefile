# Default root password
ROOT_PASSWORD ?= root

all: iso

iso: target/.stamp
target/.stamp:
	@ ./build-iso.sh "$(ROOT_PASSWORD)" && \
		touch $@

clean: clean-target clean-work
.PHONY:
clean-target:
	@ rm -rf target
.PHONY:
clean-work:
	@ rm -rf releng archiso-work

release ?=
stats ?=
main ?= main
outdir ?= ./out
progress ?=

ifndef VERBOSE
.SILENT:
endif

SPEC_FILES = $(wildcard ./spec/*_spec.cr)

override FLAGS += $(if $(release),--release )$(if $(outdir), -o $(outdir)/$(main) )$(if $(stats),--stats )$(if $(progress),--progress )$(if $(LDFLAGS),--link-flags="$(LDFLAGS)" )

clean: 
	if [ -d $(outdir) ]; then rm -rf $(outdir); fi;

.PHONY: coverage
coverage: 
	if [ ! -z $(SPEC_FILES) ] ; \
	then \
		if [ -d ./coverage ] ; then echo rm -rf ./coverage; fi; \
		if [ -f ./bin/crystal-coverage ] ; \
		then \
			./bin/crystal-coverage $(SPEC_FILES); \
		else \
			echo 'Crystal coverage not found, try running "shards install"' ; \
		fi; \
	else \
		echo 'No spec files to run code coverage on'; \
	fi;

build: clean
	mkdir $(outdir)
	crystal build $(FLAGS) $(main).cr

test:
	if [ ! -z $(SPEC_FILES) ] ; \
	then \
		crystal spec $(SPEC_FILES); \
	else \
		echo 'No spec files to run tests for'; \
	fi;
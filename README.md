# CRYSTAL QUICK START w/ MAKE

Simple [crystal lang](https://crystal-lang.org/) quick start using [make](https://www.gnu.org/software/make/)

**Targets**

- *build*
    - Compiles the crystal module 
    - defaults:
        - main=`./main` (`$(main).cr` => `$(outdir)/$(main)`)
        - outdir=`./out`
        - release=`0`
        - stats=`0`
        - progress=`0`
- *test* 
    - Runs all tests for the given spec files
    - defaults:
        - SPEC_FILES=`./spec/*_spec.cr`
- *coverage* (requires `shards install`)
    - Runs code coverage on the given spec files
    - defaults:
        - SPEC_FILES=`./spec/*_spec.cr`
- *clean*
    - Clean up build target output directory

EXECS_ESSENTIAL = sort uniq jq youtube-dl
EXECS_OPTIONAL = fzf ueberzug
EXECS_TESTING = zunit

SHELL:=/bin/zsh

.PHONY: check-essential-execs
check-essential-execs:
	$(foreach exec, $(EXECS_ESSENTIAL),\
		$(if $(shell which $(exec)),\
			,\
			$(error "No $(exec) in PATH")))


.PHONY: check-user-execs
check-user-execs: check-essential-execs
	$(foreach exec, $(EXECS_OPTIONAL),\
		$(if $(shell which $(exec)),\
			,\
			$(error "No $(exec) in PATH")))


.PHONY: check-testing-execs
check-testing-execs: check-essential-execs
	$(foreach exec, $(EXECS_TESTING),\
		$(if $(shell which $(exec)),\
			,\
			$(error "No $(exec) in PATH")))


.PHONY: check-all-execs
check-all-execs: check-user-execs check-testing-execs


.PHONY: test
test:
	unbuffer zunit run --verbose </dev/null

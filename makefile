AVM   = /usr/bin/avm
ANASM = /usr/bin/anasm

AVM_FOLDER   = ./avm
ANASM_FOLDER = ./anasm

AVM_BIN   = $(AVM_FOLDER)/bin/app
ANASM_BIN = $(ANASM_FOLDER)/bin/app

compile: $(AVM_BIN) $(ANASM_BIN)

$(AVM_FOLDER):
	git clone https://github.com/LordOfTrident/avm

$(ANASM_FOLDER):
	git clone https://github.com/LordOfTrident/anasm

$(AVM_BIN): $(AVM_FOLDER)
	cd $(AVM_FOLDER) && $(MAKE)

$(ANASM_BIN): $(ANASM_FOLDER)
	cd $(ANASM_FOLDER) && $(MAKE)

$(AVM):
	cd $(AVM_FOLDER) && $(MAKE) install

$(ANASM):
	cd $(ANASM_FOLDER) && $(MAKE) install

install: $(AVM) $(ANASM)

clean:
	rm -r $(AVM_FOLDER) $(ANASM_FOLDER)

all:
	@echo compile, install, clean

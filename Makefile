all: print verify crack
.PHONY: all crack print verify

JOHNPATH=~/git/JohnTheRipper/run

print:
	openssl x509 --in server.pem --text

verify:
	openssl rsa -noout -in server.pem -passin 'pass:test'

crack: crackme.txt
	$(JOHNPATH)/john --fork=32 crackme.txt

crackme.txt: server.pem
	$(JOHNPATH)/ssh2john.py $< > $@

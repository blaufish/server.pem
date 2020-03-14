# Crack PEMs using John the Ripper

How to build JtR if your john does not include ssh2john:

```
git clone https://github.com/magnumripper/JohnTheRipper
cd JohnTheRipper
sudo apt-get -y install clang git build-essential libssl-dev zlib1g-dev
./configure && make -s clean && make -sj4
```

How to run ssh2john and john:
```
JOHNPATH=$(PWD)/run
$JOHNPATH/ssh2john.py server.pem > crackme.txt
$JOHNPATH/john --fork=32 crackme.txt
```

# PEM file

Interresting test sample:

* Recent versions of ASUS ArmourySocketServer are shipped with server.pem.
* Certificate is Self Signed, CA:TRUE, and expired many years ago.
* Certificate appears to belong to an open source developer.
* Certificate is not added to trust stores.
* Microsoft consider the certificate invalid.

## Certificate

```
openssl x509 --in server.pem --text
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            ce:4c:b8:a2:5e:cd:7a:b4
...

            Not Before: Nov 15 21:20:06 2011 GMT
            Not After : Nov 14 21:20:06 2012 GMT
...
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:d4:74:b5:dc:00:9c:80:7c:23:da:91:67:b4:1b:
                    cc:45:98:f7:94:69:33:b1:88:9f:4b:bf:f6:81:fd:
                    d0:fc:dd:1e:21:34:ad:74:a4:29:3f:b2:c3:75:d4:
                    cc:7d:22:c3:9b:74:e5:d1:30:48:2f:ac:ad:23:f9:
                    56:6e:1c:03:a9:17:73:de:1a:81:55:5a:3d:6f:3d:
                    b4:67:1d:3f:87:c7:a6:d0:ab:b9:2a:f3:42:c0:d7:
                    10:b0:8f:97:95:14:bc:ca:40:61:47:06:8a:c7:57:
                    60:f3:7f:11:e3:a8:a9:bf:70:29:6c:68:5b:99:91:
                    12:cc:b2:79:65:92:f3:d7:d8:37:9a:94:fd:dd:10:
                    a5:b4:af:11:68:21:a8:b6:cb:fd:94:b6:84:e9:57:
                    4f:d2:ee:7c:e7:80:fa:f1:e2:57:5f:d3:fe:1e:71:
                    0b:b7:9c:20:7d:36:60:34:30:d4:49:ea:c5:b3:e6:
                    90:b3:dc:59:38:73:b4:b4:bd:16:2b:9f:34:34:4c:
                    46:17:28:6a:3d:9b:f5:50:c7:bc:3c:1d:6d:e0:34:
                    4f:9b:f9:a8:d7:46:df:82:da:6a:96:0e:7a:5c:73:
                    40:c3:ad:33:47:fd:0e:0a:9e:86:87:72:c6:5d:aa:
                    9b:d9:91:96:ae:37:d9:d9:4e:13:30:e7:54:23:cd:
                    1f:01
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                D3:3C:A7:CD:32:72:8E:CA:48:6F:FA:F2:92:EE:FA:A5:E4:9B:0C:CB
...

            X509v3 Basic Constraints:
                CA:TRUE
```

## Password is test

```
openssl rsa -noout -in server.pem -passin 'pass:test'
```


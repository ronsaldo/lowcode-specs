#!/bin/sh
# Ugly script for generating opcode numbers

cat lowcode.xml |
    grep "<instruction opcode=" |
    sed 's/.*mnemonic="\([a-zA-Z0-9]*\)".*/\1/g' |
    awk 'BEGIN{count = 256}
            {
                print "s/opcode=\"[0-9]*\" mnemonic=\"" $1 "\"/opcode=\"" count "\" mnemonic=\"" $1 "\"/g";
                count++
            }' |
    sed -f-  lowcode.xml > lowcode-enumerated.xml
mv lowcode-enumerated.xml lowcode.xml

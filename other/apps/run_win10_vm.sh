$ cat > ~/bin/run-vm
#!/bin/bash
virt-manager --connect qemu:///system --show-domain-console win10
^D

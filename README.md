# mirage-vnetif
Virtual network interface and software switch for Mirage. 

Provides the module `Vnetif` which can be used as a replacement for the regular `Netif` implementation in Xen and Unix. Stacks built using `Vnetif` are connected to a software switch that allows the stacks to communicate as if they were connected to the same LAN.

## Install
```
opam pin add mirage-vnetif https://github.com/MagnusS/mirage-vnetif.git
```

## Build examples
```
mirage configure --xen/--unix
make
```

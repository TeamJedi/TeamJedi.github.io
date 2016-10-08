# Plan

The goal of this is to generate an OpenSource equivalent to something like the [BearTooth](http://beartooth.com), or the [Gotenna](http://www.gotenna.com/).

## Parts

* $5 [PI Zero](https://www.adafruit.com/products/2885)


* $8 [USB Hub PI Zero HAT](http://www.uugear.com/product/zero4u/)
* $10 [USB Hub PI Zero HAT](http://makerspot.com/stackable-usb-hub-for-raspberry-pi-zero/)


* $7 [Realtek 8188CU dongle](http://makerspot.com/raspberry-pi-usb-wifi-dongle/)
* $12 [Realtek dongle](https://www.adafruit.com/products/814)


* $12 [LiPO charger](https://www.adafruit.com/products/259)
* $20 [LiPO charger](https://www.adafruit.com/products/2465)


* $10 [LiPO 1300 mAh battery](https://www.adafruit.com/products/258)
* $15 [LiPO 2500 mAh battery](https://www.adafruit.com/products/328)
* $20 [LiPO 4400 mAh battery](https://www.adafruit.com/products/354)
* $30 [LiPO 6000 mAh battery](https://www.adafruit.com/products/353)


* $125 [YARD Stick One + ANT700](http://hackerwarehouse.com/product/yard-stick-one-and-antenna/)


## Design

### The Jedi Firewall

Prepare an SD card, following the [PI Zero USB Ethernet Guide](https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget/ethernet-gadget).

Now we have a PI Zero that ["looks like" an Ethernet interface for any Marshmallow Android device](http://www.davebennett.tech/connect-android-to-ethernet/)

This:

* Avoids chipset adhoc limitations and packet filtering in Android that makes meshing difficult in newer devices.
* Provides a physical cable for
  * No setup required
  * Secure connection
  * Charging the Android device

The PI Zero will:

* Act as a stateful VPN and media firewall
  * Gives out a DHCP address on a 192.168.1.0/24 private network through the RNDIS interface over USB.
  * Acts as a NATting firewall protecting that private segment
  * Use zeroconf on the wlan0 interface
    * IPv4 RFC3927 zeroconf [169.254.0.0/16] with avahi-autoipd
    * IPv6 link-local
* Has three USB ports for devices:
  * One required RTL-8188CU dongle for the ad-hoc 802.11 mesh
  * Two optional USB ports:
    * Two half-duplex YARD Stick One SDRs for full-duplex wide-area sub-1Ghz gnuradio
    * Bluetooth dongle for a Bluetooth PAN, and/or Wifi dongle for an instant AP instead of using USB ethernet to Android device
* Runs the linux daemons needed for communication:
  * olsrd for Wifi mesh
  * tinc daemon for meshed VPN
  * RFC5766 TURN server for WebRTC
  * ipfs daemon for secure neighbor discovery.
    * share zeroconf address
    * share tinc eliptical key to trusted neighbors
    * share TURN login credentials

### The Jedi Internet Gateway

Prepare an SD card, configuring linux to RNDIS client tether on the USB interface to a cellphone.

Now we have a PI Zero that runs as an internet gateway for the mesh.

The USB cable makes it easy for an operator to provide connectivity for their team.

A powered USB On-The-Go (OTG) cable can let the phone charge while providing the USB tether.

### The Jedi USB Battery

Even lightsabers need a power source.

This project conceals nicely as a USB battery, the size varies based on capacity of the LiPO batteries used.

### The Jedi Android Applications

* JedIPFS as a service to join the private network
* JediMap to announce location and view trusted IPFS neighbors
* JediChat to securely chat WebRTC data channel with trusted neighbors
* JediCall to securely call WebRTC with trusted neighbors


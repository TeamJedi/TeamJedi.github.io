# Plan

The goal of this is to generate an OpenSource equivalent to something like the [BearTooth(http://beartooth.com)

## OSI Layers

Layer 1/2

    SDR
      - CDMA Data:
        - Wifi: https://github.com/bastibl/gr-ieee802-11
        - FHSS/DSSS: https://github.com/DaulPavid/gr-spread
      - Location:
        - GPS: 
        - Plane location: Mode-S/ADS-B radio
        - Other?

Layer 2/3

    IPv6 (Neighbor Discovery using zeroconf)
    Meshed VPN
        tinc
            - tinc 1.1 Parameters: Ed25519 crypto public/private keypair, Neighbors
    MANET / OLSR / MDP
         - OLSR
           - http://www.olsrd.org
           - http://www.olsr.org/?q=olsr_on_android
           - https://github.com/TeamJedi/termux-packages/tree/master/packages/olsrd
         - ProjectSPAN:
           - https://www.mitre.org/research/technology-transfer/open-source-software/smartphone-ad-hoc-networking-span
           - https://github.com/TeamJedi/ProjectSPAN
           - https://github.com/TeamJedi/SPAN
           - https://www.mitre.org/sites/default/files/pdf/12_2943.pdf
           - Defcon 20 - Off-Grid Communications with Android: Meshing the Mobile World
             - https://www.youtube.com/watch?v=sTpJuWcCsR0
             - https://github.com/TeamJedi/SPAN/tree/master/docs/DefCon%2020
           - DerbyCon - SPAN Preso
             -  https://github.com/TeamJedi/SPAN/blob/master/docs/DerbyCon%202/DerbyCon-SPAN_Preso.pdf
         - ServalProject:
           - http://www.servalproject.org/
           - https://github.com/servalproject
           - https://github.com/servalproject/ServalMaps
           - https://github.com/servalproject/lbard
           - http://developer.servalproject.org/dokuwiki/doku.php?id=content:tech:rhizome
         - Project Byzantium
           - http://project-byzantium.org/
         - Freifunk
           - https://berlin.freifunk.net/

    mdns Neighbor Discovery?
        avahi (mdns zeroconf)

Layer 4/5

    Neighbor Discovery and Crypto
        Peergos w/ipfs.io: https://github.com/Peergos/Peergos/blob/master/README.md
            - Parameters: public/private keypair, unique random namespace

Layer 7

    Android
        Web (Cordova)
            - Offline Map with self and neighbor location
                Free
                - OpenStreetMaps
                  - https://github.com/digidem/osm-p2p-db
                  - http://trevorpowell.com/2015/02/20/mapbox-gl-js-with-offline-vector-tiles-on-cordova/
                    - https://github.com/trevorpowell/mapbox-gl-js-cordova-offline
                    - https://github.com/trevorpowell/mapbox-gl-js-cordova-offline-example
                  - https://github.com/afsuarez/mapsforge-cordova-plugin
                  - https://github.com/robotnic/mapsforge-cordova-plugin-example
                Commercial
                - Cesium.js - https://cesiumjs.org/ (Bing!)
                  - https://cesiumjs.org/demos/LiveTrack24.html
                  - https://cesiumjs.org/demos/TacMap.html
		- MapBox - https://github.com/Telerik-Verified-Plugins/Mapbox
                  - https://github.com/systemed/tilemaker
                  - https://github.com/klokantech/osm-vector-cordova
            - WebRTC
                - Communicate with neighbors using text, voice, video
                - https://github.com/crosswalk-project/cordova-plugin-crosswalk-webview

## Hardware

For a SDR capable "base-station", there are two potential ways to approach this:

1. Root an Android phone and run the SDR directly.

2. Use an embedded controller like a raspberry pi 3 to make a Jed set "base station" using on-board wifi or bluetooth tethering.

An rtlsdr isn’t going to do 2.4ghz sniffing, and is receive only.
A hackrf is half-duplex and can only transmit _or_ receive at any given time.

For full-duplex SDR, the two primary contenders are:

 - Nuand BladeRF: https://github.com/Nuand/bladeRF
 - LimeSDR: http://www.limemicro.com/

Alternatively, two half-duplex devices would suffice.

For half-duplex, he did look at the TI cc1111 based devices:

  - http://www.ti.com/lit/ds/symlink/cc1110-cc1111.pdf

Such as:

  - https://github.com/greatscottgadgets/yardstick/wiki/YARD-Stick-One
  - http://gollumrf.com/
  - http://int3.cc/collections/usb/products/rfcat

Those do top out at 1Ghz, however.

Other promising TI chipsets that also support 2.4Ghz are the CC1310 and CC1350:

  - http://www.ti.com/tool/launchxl-cc1310
  - http://www.ti.com/tool/launchxl-cc1350
  - http://processors.wiki.ti.com/index.php/CC13xx_CC26xx_Tools_Overview#CC1350_Launchpad
  - http://dev.ti.com/tirex/content/tirtos_cc13xx_cc26xx_2_20_00_06/resources/cc1350LaunchPad/project0/images/cc1350_launchpad_explained.PNG

Of these, LimeSDR looks like it will not ship in time (end of this month).

I have two Nuand BladeRF devices for developing and testing SDR. One with the amplifier, one without.


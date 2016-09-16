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
    MANET / OLSR
         - ProjectSPAN:
           - https://www.mitre.org/research/technology-transfer/open-source-software/smartphone-ad-hoc-networking-span
           - https://github.com/ProjectSPAN
           - https://www.mitre.org/sites/default/files/pdf/12_2943.pdf
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

Of these, LimeSDR looks like it will not ship in time (end of this month).

I have two Nuand BladeRF devices for developing and testing SDR. One with the amplifier, one without.


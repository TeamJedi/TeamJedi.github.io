PATH:=$(PATH):../node_modules/.bin

all: android browser

www: www/css/*.css www/img/*.png www/*.html www/js/*.js

android: ./platforms/android/build/outputs/apk/android-armv7-debug.apk ./platforms/android/build/outputs/apk/android-x86-debug.apk ./platforms/android/build/outputs/apk/android-arm64-debug.apk ./platforms/android/build/outputs/apk/android-x86_64-debug.apk

browser: www
	cordova build browser

./platforms/android/build/outputs/apk/android-armv7-debug.apk: www
	cordova build android

./platforms/android/build/outputs/apk/android-x86-debug.apk: www
	cordova build android

./platforms/android/build/outputs/apk/android-arm64-debug.apk:
	cordova build android --xwalk64bit

./platforms/android/build/outputs/apk/android-x86_64-debug.apk:
	cordova build android --xwalk64bit

clean:
	rm -fr platforms/android/build
	rm -fr platforms/browser/build

try:
	cordova emulate browser

![version](https://img.shields.io/badge/version-7.1.1-blue.svg)

![dokan_grey_image](./assets/images/brand.png)

## Getting Started 🚀

To run the app use the following commands:

```sh
 flutter run
```

_\*This App works on iOS, Android._

---

## Building Apk

To build apk you need to run this following commands:

```sh
 flutter build apk

 // or
 flutter build apk --split-per-abi
```

Removing the --split-per-abi flag results in a fat APK that contains your code compiled for all the target ABIs. Such APKs are larger in size than their split counterparts, causing the user to download native binaries that are not applicable to their device’s architecture.

## File Structure

Within the download you'll find the following directories and files:

```
root/
├── android
├── assets
├── build
├── ios
├── lib
│   ├── common
│   ├── core
│   ├── data
│   ├── feature
│   ├── routes
│   └── main.dart
├── test
├── appname.iml
├── pubspec.lock
├── pubspec.yaml
└── splash.yaml

```

## Running Tests 🧪

```sh
 flutter test
```

### added few unit test for now, i'll add some integration test and widget test later. (hopefully 👀)

---

## TODO:

- [x] App Name, App Icon <br/>
- [x] Theme and Color Palette <br/>
- [x] Login(Sign In) UI <br/>
- [x] Sign Up UI <br/>
- [x] Home Layout with Bottom Nav <br/>
- [x] Auth Flow API Integration <br/>
- [x] Unit Testing for Auth <br/>
- [x] Product List UI <br/>
- [x] Product List Filter UI <br/>
- [x] Fetch Product List from asset json <br/>
- [x] Native Splash <br/>
- [x] My Account UI <br/>
- [x] My Account API Integration <br/>
- [x] Update Profile UI <br/>
- [x] Update Profile API Integration <br/>
- [ ] Review Review Review <br/>
- [ ] More Unit Test <br/>

---

## [Developed for WeDevs](https://wedevs.com/)

![WeDevs](https://wedevs.com/img/logos/wedevs/wedevs-logo-colored.svg)

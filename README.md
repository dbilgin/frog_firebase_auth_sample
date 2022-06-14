# frog_firebase_auth_sample

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

A sample backend project sample with Firebase auth verification using dart_frog.

<h2>☢️ This is a sample project and <a href="https://github.com/VeryGoodOpenSource/dart_frog">dart_frog</a> is currently experimental. ☢️</h2>

## How it works

This project uses [postgres](https://pub.dev/packages/postgres) and [firebase_auth_admin_verify](https://pub.dev/packages/firebase_auth_admin_verify).

For both these packages to work properly first you need to do some set-up.

- Create a `.env` file at the root of the project which would include the data below for the postgres connection:

```
DB_HOST=
DB_PORT=
DB_NAME=
DB_USERNAME=
DB_PASSWORD=
```

- For `verifyFirebaseToken` function to work properly, you either need to pass your Firebase project id from your [Firebase console](https://console.firebase.google.com/) or you can use a [service account json](https://firebase.google.com/docs/admin/setup#initialize-sdk) file.

- Once this is done, don't forget to get the packages

```
dart pub get
```

- And finally this project also uses [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable) to generate the model for the frogs.

```
dart run build_runner build
```

This should generate `frog.freezed.dart` and `frog.g.dart` files.

- All done!

## Start the server

You can simply run `dart_frog dev`. For more information check out [dart_frog](https://github.com/VeryGoodOpenSource/dart_frog).

If you are using VS Code, this project includes a launch configuration called `froggy` to start the dev server. So you can simply open one of the dart files and press F5 and start the dev server.

## Aim of the project

This is a proof of concept to get user authentication through JWTs or Firebase auth in this case using [dart_frog](https://github.com/VeryGoodOpenSource/dart_frog) and continue with the usual cycle with DB changes.

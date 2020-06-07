# Isotope Mock Auth Service

Extends the Isotope `AuthServiceAdapter` and provides a `MockAuthService` for testing authentication.

## Installation

Add the following dependencies to your `pubspec.yaml`:

```dart
dependences:
  isotope_auth:
    git: git://github.com/isotopeltd/isotope_auth.git
  isotope_auth_mock:
    git: git://github.com/isotopeltd/isotope_auth_mock.git
```

## Implementation

In your project, import the package:

```dart
import 'package:isotope_auth_mock/isotope_auth_mock';
```

Then instantiate a new `MockAuthService` object:

```dart
// authService constant is used in later examples:
const MockAuthService authService = new MockAuthService();
```

If you are using the `Isotope` framework, you'll likely be register the `MockAuthService` as a lazy singleton object using `registrar` service locator:

```dart
import 'package:isotope/registrar.dart';

void setup() {
  Registrar.instance.registerLazySingleton<MockAuthService>(MockAuthService());
}
```

See the [registrar documentation](https://github.com/IsotopeLtd/isotope/tree/master/lib/src/registrar) for information about registering, fetching, resetting and unregistering lazy singletons.

### Sign in

Signs in to the mock auth service.

Method signature:

```dart
Future<IsotopeIdentity> signIn()
```

The method will return an `IsotopeIdentity` object.

Example:

```dart
IsotopeIdentity identity = await authService.signIn({});
```

### Sign out

Signs out of the mock auth service.

Method signature:

```dart
Future<void> signOut()
```

Example:

```dart
await authService.signOut();
```

### Current identity

Returns an `IsotopeIdentity` object if the user is authenticated or `null` when not authenticated.

Method signature:

```dart
Future<IsotopeIdentity> currentIdentity()
```

Example:

```dart
IsotopeIdentity identity = authService.currentIdentity();
```

## License

This library is available as open source under the terms of the MIT License.

## Copyright

Copyright © 2020 Jurgen Jocubeit

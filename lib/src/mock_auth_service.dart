import 'dart:async';
import 'package:isotope_auth/isotope_auth.dart';
import 'package:random_string/random_string.dart' as random;

/// Mock authentication service to be used for testing.
class MockAuthService extends AuthServiceAdapter {
  MockAuthService({
    this.startupTime = const Duration(milliseconds: 250),
    this.responseTime = const Duration(seconds: 2),
  }) {
    Future<void>.delayed(responseTime).then((_) {
      _saveIdentity(null);
    });
  }

  final Duration startupTime;
  final Duration responseTime;

  IsotopeIdentity _currentIdentity;

  @override
  Future<IsotopeIdentity> currentIdentity() async {
    await Future<void>.delayed(startupTime);
    return _currentIdentity;
  }

  @override
  AuthProvider get provider {
    return AuthProvider.mock;
  }

  @override
  Future<IsotopeIdentity> signIn(Map<String, dynamic> _credentials) async {
    await Future<void>.delayed(responseTime);
    final IsotopeIdentity identity = IsotopeIdentity(
      uid: random.randomAlphaNumeric(32)
    );
    _saveIdentity(identity);
    return identity;
  }

  @override
  Future<void> signOut() {
    _currentIdentity = null;
    _saveIdentity(null);
    return null;
  }

  void _saveIdentity(IsotopeIdentity identity) {
    _currentIdentity = identity;
    authStateChangedController.add(identity);
  }
}

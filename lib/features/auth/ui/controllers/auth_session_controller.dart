import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppAuthStatus { initializing, authenticated, unauthenticated }

class AuthSessionController extends ChangeNotifier {
  final SupabaseClient _supabase;
  late final StreamSubscription<AuthState> _authSubscription;
  AppAuthStatus _status = AppAuthStatus.initializing;

  AuthSessionController({required SupabaseClient supabase})
    : _supabase = supabase {
    _listenToAuthChanges();
  }

  AppAuthStatus get status => _status;
  bool get isAuthenticated => _status == AppAuthStatus.authenticated;
  User? get currentUser => _supabase.auth.currentUser;

  void _listenToAuthChanges() {
    _authSubscription = _supabase.auth.onAuthStateChange.listen(
      (AuthState data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;

        debugPrint("Auth event: $event");

        switch (event) {
          case AuthChangeEvent.initialSession:
          case AuthChangeEvent.signedIn:
          case AuthChangeEvent.tokenRefreshed:
          case AuthChangeEvent.userUpdated:
            _updateSession(session);
            break;

          case AuthChangeEvent.signedOut:
            _setStatus(AppAuthStatus.unauthenticated);
            break;

          default:
            break;
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        debugPrint("❎ Auth stream error: $error");
      },
    );
  }

  void _updateSession(Session? session) {
    final AppAuthStatus nextStatus = session != null
        ? AppAuthStatus.authenticated
        : AppAuthStatus.unauthenticated;

    _setStatus(nextStatus);
  }

  void _setStatus(AppAuthStatus newStatus) {
    if (_status == newStatus) return;

    _status = newStatus;
    notifyListeners();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}

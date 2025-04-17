import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Enum representing network status
enum NetworkStatus { connected, disconnected }

/// NetworkStateNotifier to track connectivity changes
class NetworkStateNotifier extends StateNotifier<List<ConnectivityResult>> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkStateNotifier() : super([ConnectivityResult.none]) {
    _initConnectivity();
    _monitorConnectivity();
  }

  /// Initialize and check current connection status
  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      state = result;
    } catch (e) {
      state = [ConnectivityResult.none]; // Default to no internet
    }
  }

  /// Listen for real-time connectivity changes
  void _monitorConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      state = result;
    });
  }

  /// Dispose the subscription to avoid memory leaks
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Riverpod provider for network state
final networkProvider =
StateNotifierProvider<NetworkStateNotifier, List<ConnectivityResult>>((ref) {
  return NetworkStateNotifier();
});

final networkConnectionProvider=Provider<bool>((ref)=>ref.watch(networkProvider).any((status) =>
status == ConnectivityResult.wifi ||
status == ConnectivityResult.mobile ||
status == ConnectivityResult.ethernet)
);
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

/// A widget that monitors internet connectivity and displays an offline banner when needed.
/// 
/// It wraps the [child] widget in a [Stack] and overlays a notification bar at the bottom
/// if the device loses internet connection.
class AppOfflineBuilder extends StatelessWidget {
  /// The widget to be displayed under the connectivity banner.
  final Widget child;

  const AppOfflineBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        final connectivityResults = snapshot.data;
        
        // If results are null (still loading) or contains none, show offline banner
        final isOffline = connectivityResults == null || 
                         connectivityResults.contains(ConnectivityResult.none);

        return Stack(
          children: [
            child,
            if (isOffline)
              // TODO: Implement a smoother transition animation for the banner.
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Center(
                    child: Text(
                      'No Internet Connection',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

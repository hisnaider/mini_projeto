import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.child, required this.loading});
  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (!loading) return child;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Stack(
        children: [
          child,
          const Opacity(
            opacity: 0.9,
            child: ModalBarrier(color: Colors.white, dismissible: false),
          ),
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

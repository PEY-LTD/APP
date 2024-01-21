import 'package:flutter/material.dart';

class KAnimatedWidget extends StatefulWidget {
  final Widget child;
  final bool? dismiss;

  /// Delay in milliseconds
  final int? delay;

  const KAnimatedWidget({
    super.key,
    required this.child,
    this.delay,
    this.dismiss,
  });

  @override
  State<KAnimatedWidget> createState() => _KAnimatedWidgetState();
}

class _KAnimatedWidgetState extends State<KAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;
  late ValueNotifier<bool?> notifyDismiss;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    //Initialize slide animation
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    // Initialize fade animation
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );

    // Dismiss current widget
    notifyDismiss = ValueNotifier(widget.dismiss);

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: widget.delay ?? 300));
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
        valueListenable: notifyDismiss,
        builder: (context, value, child) {
          if (value != null && value) {
            _animationController.reverse();
          }
          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: widget.child,
            ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

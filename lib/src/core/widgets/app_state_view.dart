import '../resources/colors.dart';
import '../resources/constants.dart';

import 'app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/enum.dart';

class AppStateView extends StatefulWidget {
  final AppState state;
  final String message;
  final VoidCallback onOK;
  final VoidCallback? onCancel;
  final String okText;
  final String? cancelText;
  final bool autoNav;

  const AppStateView({
    super.key,
    required this.state,
    required this.message,
    required this.onOK,
    this.onCancel,
    this.okText = 'OK',
    this.cancelText,
    this.autoNav = false,
  });

  @override
  State<AppStateView> createState() => _AppStateViewState();
}

class _AppStateViewState extends State<AppStateView> {
  @override
  void initState() {
    if (widget.autoNav) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 2000), () => widget.onOK());
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 80.0,
        // height: 500.0,
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          type: MaterialType.transparency,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: stateIcon,
              ),

              //* Vertical Spacer
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12.0,
                ),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(),
                ),
              ),

              //* Vertical Spacer
              hc(h: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.cancelText != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 40.0,
                            child: AppButton(
                              type: AppButtonType.text,
                              text: widget.cancelText ?? 'Cancel',
                              onPressed: widget.onCancel ?? () {},
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.autoNav
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 40.0,
                            child: AppButton(
                              type: AppButtonType.primary,
                              text: widget.state == AppState.failed
                                  ? widget.okText
                                  : 'Close',
                              onPressed: () => widget.onOK.call(),
                            ),
                          ),
                        ),
                ],
              ),

              //* Vertical Spacer
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget get stateIcon {
    switch (widget.state) {
      case AppState.success:
        return CircleAvatar(
          backgroundColor: Palette.blueHue.withOpacity(0.2),
          radius: 100,
          child: CircleAvatar(
            backgroundColor: Palette.blueHue.withOpacity(0.2),
            radius: 70,
            child: Icon(
              FontAwesomeIcons.check,
              color: Colors.white.withOpacity(0.7),
              size: 60,
            ),
          ),
        );
      case AppState.failed:
        return CircleAvatar(
          backgroundColor: Palette.blueHue.withOpacity(0.2),
          radius: 100,
          child: CircleAvatar(
            backgroundColor: Palette.blueHue.withOpacity(0.2),
            radius: 70,
            child: Icon(
              FontAwesomeIcons.xmark,
              color: Colors.red.shade300,
              size: 60,
            ),
          ),
        );
      default:
        return CircleAvatar(
          backgroundColor: Palette.blueHue.withOpacity(0.2),
          radius: 100,
          child: CircleAvatar(
            backgroundColor: Palette.blueHue.withOpacity(0.2),
            radius: 70,
            child: const Icon(
              FontAwesomeIcons.check,
              color: Colors.white,
              size: 60,
            ),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';

class AppSwitchTile extends StatefulWidget {
  final String title;
  final void Function(bool)? onChange;
  final bool value;

  const AppSwitchTile({
    super.key,
    this.onChange,
    required this.title,
    required this.value,
  });

  @override
  State<AppSwitchTile> createState() => _AppSwitchTileState();
}

class _AppSwitchTileState extends State<AppSwitchTile> {
  bool enabled = false;

  @override
  void initState() {
    super.initState();

    enabled = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          enabled = !enabled;
        });

        widget.onChange?.call(enabled);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
            ),
            Switch(
              value: enabled,
              onChanged: (value) {
                setState(() {
                  enabled = value;
                });

                widget.onChange?.call(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

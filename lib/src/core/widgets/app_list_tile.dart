import 'package:flutter/material.dart';

class AppListTile extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  final IconData? trailer;

  const AppListTile({
    super.key,
    required this.title,
    this.onTap,
    this.trailer,
  });

  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            Icon(
              widget.trailer ?? Icons.chevron_right,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}

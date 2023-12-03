import 'package:flutter/material.dart';

class SideBarListTile extends StatefulWidget {
  final bool selected;
  final String listTileText;
  final IconData icon;
  final VoidCallback onTap;

  const SideBarListTile(
      {Key? key,
      required this.selected,
      required this.listTileText,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  State<SideBarListTile> createState() => _SideBarListTileWidgetState();
}

class _SideBarListTileWidgetState extends State<SideBarListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        hoverColor: Colors.indigo,
        leading: Icon(
          widget.icon,
          color: Colors.white,
        ),
        title: widget.selected
            ? Text(
                widget.listTileText,
                style: const TextStyle(color: Colors.white),
                softWrap: false,
              )
            : const Text(""),
        onTap: widget.onTap);
  }
}

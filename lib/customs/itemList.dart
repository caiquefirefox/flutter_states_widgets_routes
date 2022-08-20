import 'package:flutter/material.dart';

Widget getItemList(String title, String subtitle, IconData? icon)
{
  return Card(
    child: ListTile(
      leading: icon != null ? Icon(icon) : const Icon(Icons.blur_circular),
      title: Text(title),
      subtitle: Text(subtitle)
    )
  );
}

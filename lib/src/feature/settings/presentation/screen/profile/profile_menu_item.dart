import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final Icon icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        splashColor: Theme.of(context).splashColor,
        onTap: onPress,
        leading: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          child: icon,
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        trailing: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}

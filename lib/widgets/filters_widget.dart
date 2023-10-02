import 'package:flutter/material.dart';

class filtertype extends StatefulWidget {
  filtertype({
    super.key,
    required this.type,
    required this.title,
    required this.subtitle,
    this.onChanged,
  });

  late bool type;
  final String title;
  final String subtitle;
  final ValueChanged<bool>? onChanged;
  @override
  State<filtertype> createState() => _filtertypeState();
}

class _filtertypeState extends State<filtertype> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.type,
      onChanged: (isChecked) {
        if (widget.onChanged != null) {
          widget.onChanged!(isChecked);
        }
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(widget.subtitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}

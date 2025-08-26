import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final String memberName;
  final String jobTitle;
  final String department;
  final VoidCallback onAddTimeRecord;
  final VoidCallback onDeactivate;

  const MemberTile({
    super.key,
    required this.memberName,
    required this.jobTitle,
    required this.department,
    required this.onAddTimeRecord,
    required this.onDeactivate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(memberName),
            Text(jobTitle, style: Theme.of(context).textTheme.bodySmall),
            Text(department, style: Theme.of(context).textTheme.bodySmall),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.punch_clock_outlined, color: Colors.blue),
                  onPressed: onAddTimeRecord,
                ),
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.red),
                  onPressed: onDeactivate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

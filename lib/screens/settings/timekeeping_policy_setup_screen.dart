import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/models/zztimekeeping_policy_schedule.dart';
import 'package:tipon_timekeeping_app/models/zztimekeepingpolicy.dart';
import 'package:tipon_timekeeping_app/screens/settings/timekeeping_policy_setup_variable_screen.dart';

class TimekeepingPolicySetupScreen extends StatefulWidget {
  const TimekeepingPolicySetupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimekeepingPolicySetupScreenState createState() => _TimekeepingPolicySetupScreenState();
}

class _TimekeepingPolicySetupScreenState extends State<TimekeepingPolicySetupScreen> {
  final List<TimekeepingPolicy> _policies = [
    TimekeepingPolicy(
      policyId: 1, policyName: 'Policy 1', schedules: [
      TimekeepingPolicySchedule(policyId: 1, scheduleCode: 1, timeIn: '0800',timeOut: '1700', totalHours: 9.0),
      TimekeepingPolicySchedule(policyId: 1, scheduleCode: 1, timeIn: '0900',timeOut: '1800', totalHours: 9.0),
    ]),
    TimekeepingPolicy(policyId: 2, policyName: 'Policy 2', schedules: []),
  ];
  int _nextPolicyId = 3;

  void _addPolicy() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => TimekeepingPolicySetupVariableScreen(),
    ),
  );    
  }

  // void _addPolicy() {
  //   TextEditingController controller = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text('Add Policy'),
  //       content: TextField(
  //         controller: controller,
  //         decoration: InputDecoration(hintText: 'Enter policy name'),
  //       ),
  //       actions: [
  //         TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() {
  //               _policies.add(TimekeepingPolicy(
  //                 policyId: _nextPolicyId++,
  //                 policyName: controller.text,
  //                 schedules: [],
  //               ));
  //             });
  //             Navigator.pop(context);
  //           },
  //           child: Text('Add'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _editPolicy(TimekeepingPolicy policy) {
    TextEditingController controller = TextEditingController(text: policy.policyName);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Policy'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Edit policy name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                policy.policyName = controller.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  // void _deletePolicy(TimekeepingPolicy policy) {
  //   setState(() {
  //     _policies.removeWhere((c) => c.policyId == policy.policyId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timekeeping Policy Setup')),
      body: ListView.builder(
        itemCount: _policies.length,
        itemBuilder: (context, index) {
          final timekeepingPolicy = _policies[index];
          return ListTile(
            title: Text(timekeepingPolicy.policyName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimekeepingPolicySetupScreen(),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editPolicy(timekeepingPolicy),
                ),
                // IconButton(
                //   icon: Icon(Icons.delete, color: Colors.red),
                //   onPressed: () => _deletePolicy(timekeepingPolicy),
                // ),
              ],
            ),
           );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPolicy,
        tooltip: 'Add Timekeeping Policy',
        child: Icon(Icons.add),
      ),
    );
  }
}
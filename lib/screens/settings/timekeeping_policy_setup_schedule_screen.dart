import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/models/zztimekeeping_policy_schedule.dart';
import 'package:tipon_timekeeping_app/models/zztimekeepingpolicy.dart';

class TimekeepingPolicySetupScheduleScreen extends StatefulWidget {
  final TimekeepingPolicy policy;

  const TimekeepingPolicySetupScheduleScreen({super.key, required this.policy, required TimekeepingPolicy timekeepingPolicy});

  @override
  // ignore: library_private_types_in_public_api
  _TimekeepingPolicySetupScheduleScreenState createState() => _TimekeepingPolicySetupScheduleScreenState();
}

class _TimekeepingPolicySetupScheduleScreenState extends State<TimekeepingPolicySetupScheduleScreen> {
  int _nextProductId = 100;

  void _addSchedule() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Schedule'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter schedule'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.policy.schedules.add(
                  TimekeepingPolicySchedule(policyId: _nextProductId++, scheduleCode: 0, timeIn: '0800', timeOut: '1300', totalHours: 9.0),
                );
              });
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _editSchedule(TimekeepingPolicySchedule schedule) {
    TextEditingController controller = TextEditingController(text: schedule.scheduleCode.toString());
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Schedule'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Edit product name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // schedule.scheduleCode = cacontroller.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteSchedule(TimekeepingPolicySchedule schedule) {
    setState(() {
      widget.policy.schedules.removeWhere((p) => p.policyId == schedule.policyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final schedules = widget.policy.schedules;
    return Scaffold(
      appBar: AppBar(title: Text('${widget.policy.policyName} Schedules')),
      body: schedules.isEmpty
          ? Center(child: Text('No Schedule'))
          : ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return ListTile(
                  title: Text(schedule.policyId.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editSchedule(schedule),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteSchedule(schedule),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSchedule,
        tooltip: 'Add Schedule',
        child: Icon(Icons.add),
      ),
    );
  }
}

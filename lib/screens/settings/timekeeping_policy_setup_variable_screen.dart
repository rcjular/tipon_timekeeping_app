// lib/screens/input_form_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting

class TimekeepingPolicySetupVariableScreen extends StatefulWidget {
  const TimekeepingPolicySetupVariableScreen({Key? key}) : super(key: key);

  @override
  State<TimekeepingPolicySetupVariableScreen> createState() => _TimekeepingPolicySetupVariableState();
}

class _TimekeepingPolicySetupVariableState extends State<TimekeepingPolicySetupVariableScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _floatController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _policyNameController = TextEditingController();
  final TextEditingController _minimumRequiredOvertime = TextEditingController();
  final TextEditingController _durationOvertimePerCount = TextEditingController();
  final TextEditingController _basisOfOvertime = TextEditingController();
  final TextEditingController _startDateOvertime = TextEditingController();
  final TextEditingController _endDateOvertime = TextEditingController();
  final TextEditingController _maximumRegularHours = TextEditingController();
  final TextEditingController _lateGracePeriod = TextEditingController();
  final TextEditingController _lateCount = TextEditingController();
  final TextEditingController _paidupHolidayBasis = TextEditingController();
  final TextEditingController _nightDiffHoursbasis = TextEditingController();

  String? _selectedOption;
  final List<String> _options = ['Option A', 'Option B', 'Option C'];

  String? _selectedBasisOfOvertime;
  final List<String> _basisOfOvertimeList = ['Day', 'Weekly', 'Monthly'];

  @override
  void dispose() {
    _textController.dispose();
    _floatController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Policy Variables')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _policyNameController,
                  decoration: const InputDecoration(
                    labelText: 'Policy Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16,width: 50,),
                TextFormField(
                  controller: _minimumRequiredOvertime,
                  decoration: const InputDecoration(
                    labelText: 'Minimum Required Overtime(Minutes)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (val) {
                    if (val == null || val.isEmpty) return 'Required';
                    final v = double.tryParse(val);
                    return v == null ? 'Enter Minimum Required Overtime(Minutes)' : null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _durationOvertimePerCount,
                  decoration: const InputDecoration(
                    labelText: 'Duration of Overtime per Count (Minutes)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (val) {
                    if (val == null || val.isEmpty) return 'Required';
                    final v = double.tryParse(val);
                    return v == null ? 'Enter Duration of Overtime per Count (Minutes)' : null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Basis of Overtime',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedBasisOfOvertime,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: _basisOfOvertimeList
                      .map((opt) => DropdownMenuItem(
                            value: opt,
                            child: Text(opt),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedBasisOfOvertime = val),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Select option' : null,
                ),
                const SizedBox(height: 24),                
                TextFormField(
                  controller: _startDateOvertime,
                  decoration: InputDecoration(
                    labelText: 'Start Date of Overtime Consideration',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _pickDate,
                    ),
                  ),
                  readOnly: true,
                  onTap: _pickDate,
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Select a date' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _endDateOvertime,
                  decoration: InputDecoration(
                    labelText: 'End Date of Overtime Consideration',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _pickDate,
                    ),
                  ),
                  readOnly: true,
                  onTap: _pickDate,
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Select a date' : null,
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _startDateOvertime,
                  decoration: InputDecoration(
                    labelText: 'Start Date of Overtime Consideration',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _pickDate,
                    ),
                  ),
                  readOnly: true,
                  onTap: _pickDate,
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Select a date' : null,
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final result = {
                        'text': _textController.text,
                        'float': double.parse(_floatController.text),
                        'date': _dateController.text,
                        'dropdown': _selectedOption,
                      };
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data: $result')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

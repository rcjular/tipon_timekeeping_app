import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/widgets/member_tile.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreen();
}

class _MemberScreen extends State<MemberScreen> {
   final List<Map<String, String>> cardData = const [
    {
      "memberName": "Jenon Lee",
      "jobTitle": "IT Manager",
      "department": "Harmony"
    },
    {
      "memberName": "Adelia Ombrosa",
      "jobTitle": "Marketing Manager",
      "department": "Symphony"
    },
    {
      "memberName": "Kia  Hernandez",
      "jobTitle": "Support Manager",
      "department": "Symphony"
    },
  ];


  // void _addItem() {
  //   TextEditingController controller = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Add Item"),
  //       content: TextField(
  //         controller: controller,
  //         decoration: const InputDecoration(hintText: "Enter item name"),
  //       ),
  //       actions: [
  //         TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() => items.add(controller.text));
  //             Navigator.pop(context);
  //           },
  //           child: const Text("Add"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _editItem(int index) {
  //   TextEditingController controller = TextEditingController(text: cardData[index]);

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Edit Item"),
  //       content: TextField(
  //         controller: controller,
  //         decoration: const InputDecoration(hintText: "Edit item"),
  //       ),
  //       actions: [
  //         TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() => cardData[index] = controller.text as Map<String, String>);
  //             Navigator.pop(context);
  //           },
  //           child: const Text("Save"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _deleteItem(int index) {
  //   setState(() => cardData.removeAt(index));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final item = cardData[index];
          return MemberTile(
            memberName: item["memberName"]!,
            jobTitle: item["jobTitle"]!,
            department: item["department"]!,
            onAddTimeRecord: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item["memberName"]} adding DTR!")),
              );
            },
            onDeactivate: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item["memberName"]} deactivate!")),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
              },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add_to_queue),
      ),
    );
  }
}
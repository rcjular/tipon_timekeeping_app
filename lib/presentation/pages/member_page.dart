// presentation/pages/user_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/member_provider.dart';

class MemberPage extends ConsumerWidget {
  final String memberId;
  const MemberPage({super.key, required this.memberId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMember = ref.watch(memberProvider(memberId));

    return Scaffold(
      appBar: AppBar(title: const Text("Members")),
      body: asyncMember.when(
        data: (member) =>
            member == null ? const Text("Member not found") : Text("Hello, ${member.membername}!"),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
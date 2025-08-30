// presentation/providers/member_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../../data/datasources/member_remote_datasource.dart';
// import '../../data/datasources/member_rest_datasource.dart';
import '../../data/datasources/member_local_datasource.dart';
import '../../data/repositories/member_repository_impl.dart';
import '../../domain/entities/member.dart';
import '../../domain/usecases/get_member.dart';

final memberRepositoryProvider = Provider((ref) {
  // const useFirestore = true;

  final memberBox = Hive.box<Map>('members');
  final localDs = HiveMemberLocalDataSource(memberBox);
  
  final remoteDs = FirestoreMemberRemoteDataSource(FirebaseFirestore.instance);

  // final remoteDs = useFirestore
  //     ? FirestoreMemberRemoteDataSource(FirebaseFirestore.instance)
  //     : RestMemberRemoteDataSource(
  //         baseUrl: "https://api.example.com",
  //         client: http.Client(),
  //       );

  return MemberRepositoryImpl(
    remoteDataSource: remoteDs,
    localDataSource: localDs,
  );
});

final getMemberUseCaseProvider = Provider((ref) {
  return GetMember(ref.watch(memberRepositoryProvider));
});

final memberProvider = FutureProvider.family<Member?, String>((ref, memberid) {
  final getMember = ref.watch(getMemberUseCaseProvider);
  return getMember(memberid);
});

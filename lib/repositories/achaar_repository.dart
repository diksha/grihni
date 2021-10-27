import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/Achaar.dart';
import 'package:junkiri/services/firestore_service.dart';

final achaarProvider = FutureProvider.family<Achaar,String>((ref,achaarType) async {
  FirestoreService _firestoreService = FirestoreService();
  Achaar achaar = await _firestoreService.getAchaar(achaarType);
  return achaar;
});

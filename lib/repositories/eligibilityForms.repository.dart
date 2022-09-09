import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:eligibility_flutter_firebase/entities/eligibilityForm.entity.dart';

typedef JSONList = List<Map<String, dynamic>>;
typedef FormsList = List<EligibilityForm>;

class EligibilityFormsRepository {
  final Dio httpClient;
  final FirebaseFirestore storageClient;

  EligibilityFormsRepository(this.httpClient, this.storageClient);

  Future<JSONList> getFormsJsonList() async {
    try {
      final response =
          await httpClient.get<String>('https://pastebin.com/raw/zPUtKAdx');
      if (response.data == null) throw Exception('Could not retrive data');
      final data = JSONList.from(jsonDecode(response.data!));
      return data;
    } on DioError catch (e) {
      return throw Exception(e.message);
    }
  }

  Future<bool> _isCollectionAlreadyFilled(String collectionPath) async {
    final queryResult = await storageClient.collection(collectionPath).get();
    return queryResult.size > 0;
  }

  Future<void> storeDocsOnCollection(
      JSONList data, String collectionPath) async {
    try {
      final isCollectionFilled =
          await _isCollectionAlreadyFilled(collectionPath);
      if (isCollectionFilled) return;
      for (var item in data) {
        await storageClient.collection(collectionPath).add(item);
      }
    } on Error catch (e) {
      throw Exception('Could not store forms: ${e.toString()}');
    }
  }

  Future<FormsList> queryDocsFromCollection(String collectionPath) async {
    try {
      final queryResult = await storageClient.collection(collectionPath).get();
      final formsList = queryResult.docs
          .map((formDocument) => EligibilityForm.fromJson(formDocument.data()))
          .toList();
      return formsList;
    } on Error catch (e) {
      return throw Exception('Could not query forms: ${e.toString()}');
    }
  }
}

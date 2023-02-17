import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/data/user_future.dart';
import 'package:dio/dio.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<UserFuture> fetchUserData() {
    const uri = 'https://jsonplaceholder.typicode.com/users/1';
    return Dio().get(uri).then((value) {
      print(value);
      return UserFuture.fromMap(value.data);
    });
  }

  Future<List<UserFuture>> fetctUserListData() {
    const uri = 'https://jsonplaceholder.typicode.com/users';
    return Dio().get(uri).then((value) {
      print(value);
      return (value.data as List).map((e) => UserFuture.fromMap(e)).toList();
    });
  }

  Future<UserFuture> fetchUserDataPagination(String userNo) {
    String uri = 'https://jsonplaceholder.typicode.com/users/$userNo';
    return Dio().get(uri).then((value) {
      print(value);
      return UserFuture.fromMap(value.data);
    });
  }
}

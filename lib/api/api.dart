import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:redux_tutorial/models/post.dart';
import 'package:redux_tutorial/models/user.dart';

class Api {
  final Dio _dio;

  Api(this._dio) {
    assert(_dio.options.baseUrl.isNotEmpty);
  }

  Future<List<User>> getUsers() async {
    try {
      final response = await _dio.get<List>("users");
      return response.data!.map((json) => User.fromJson(json)).toList();
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An api error occurred");
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get<List>("posts");
      return response.data!.map((json) => Post.fromJson(json)).toList();
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An api error occurred");
    }
  }

  Future<List<Post>> getPostsOfUser(int userId) async {
    try {
      final response = await _dio.get<List>("users/$userId/posts");
      return response.data!.map((json) => Post.fromJson(json)).toList();
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An api error occurred");
    }
  }
}

class ApiException {
  final String message;

  ApiException(this.message);
}

import 'dart:developer';
import 'package:animal_cli/src/services/custom_exception.dart';
import 'package:animal_cli/src/services/rest_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IRestClient {
  final Dio _dio = Dio();

  BaseOptions options = BaseOptions(
    headers: {
      'Content-Type': 'application/json',
    },
  );

  @override
  Future getAllData({required String url}) async {
    try {
      final response = await _dio.get(url);
      log('GET OK');
      return response.data;
    } on DioException catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  @override
  Future postData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      await _dio.post(
        url,
        data: data,
      );
      log('POST OK');
    } on DioException catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  @override
  Future deleteData({required String url}) async {
    try {
      await _dio.delete(url);
      log('delete OK');
    } on DioException catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  @override
  Future putData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      await _dio.put(url, data: data);
      log('put OK');
    } on DioException catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  @override
  Future getByIdData({required String url}) async {
    try {
      final response = await _dio.get(
        url,
      );
      log('delete OK');
      return response.data;
    } on DioException catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }
}

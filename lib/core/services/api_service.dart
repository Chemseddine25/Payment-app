import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required dynamic body, // جعلناه dynamic ليكون أكثر مرونة
    required String token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          // هنا نضمن إرسال التوكن في كل الحالات
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } on DioException catch (e) {
      // هذا السطر سيطبع لك الخطأ بوضوح بلون مختلف في بعض المحررات
      debugPrint("🚨 STRIPE ERROR: ${e.response?.data}");

      // استخراج الرسالة التي يفهمها البشر
      String errorMessage =
          e.response?.data['error']['message'] ?? "Unknown Error";
      throw Exception(errorMessage);
    }
  }
}

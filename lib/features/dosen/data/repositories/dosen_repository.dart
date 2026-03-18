import 'package:dio/dio.dart';
import 'package:learning_project/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/users',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      print(data);
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.data}');
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }
}

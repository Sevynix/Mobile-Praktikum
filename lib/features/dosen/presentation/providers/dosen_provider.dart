import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_project/core/services/local_storage_service.dart';
import 'package:learning_project/features/dosen/data/models/dosen_model.dart';
import 'package:learning_project/features/dosen/data/repositories/dosen_repository.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final dosenRepositoryProvider = Provider<DosenRepository>((ref) {
  return DosenRepository();
});

final savedUsersProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  final savedUsers = await storage.getSavedUsers();
  return savedUsers
      .map(
        (user) => {
          'user_id': user['user_id'].toString(),
          'username': user['username'].toString(),
          'saved_at': user['saved_at'].toString(),
        },
      )
      .toList();
});

final savedUserProvider = FutureProvider<Map<String, String>?>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  final userId = await storage.getUserId();
  final username = await storage.getUsername();
  final token = await storage.getToken();

  if (userId == null && username == null && token == null) {
    return null;
  }

  return {
    'userId': userId ?? '',
    'username': username ?? '',
    'token': token ?? '',
  };
});

class DosenNotifier extends StateNotifier<AsyncValue<List<DosenModel>>> {
  final DosenRepository _repository;
  final LocalStorageService _storage;

  DosenNotifier(this._repository, this._storage)
      : super(const AsyncValue.loading()) {
    loadDosenList();
  }

  Future<void> loadDosenList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getDosenList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadDosenList();
  }

  Future<void> saveSelectedDosen(DosenModel dosen) async {
    await _storage.addUserToSavedList(
      userId: dosen.id.toString(),
      username: dosen.username,
    );
  }

  Future<void> removeSavedUser(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  Future<void> clearSavedUsers() async {
    await _storage.clearSavedUsers();
  }
}

final dosenNotifierProvider = StateNotifierProvider.autoDispose<DosenNotifier, AsyncValue<List<DosenModel>>>((ref) {
  final repository = ref.watch(dosenRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);
  return DosenNotifier(repository, storage);
});
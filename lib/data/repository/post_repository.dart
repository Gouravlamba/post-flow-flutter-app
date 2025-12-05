import '../models/post_model.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';

class PostRepository {
  final ApiService apiService;
  final LocalStorageService localStorageService;

  PostRepository({required this.apiService, required this.localStorageService});

  // Load posts from local storage first.
  Future<List<PostModel>> getLocalPosts() async {
    return await localStorageService.getCachedPosts();
  }

  // Fetch posts from API, update local cache.
  Future<List<PostModel>> fetchAndCachePosts() async {
    final rawList = await apiService.getPosts();
    final readIds = await localStorageService.getReadPostIds();

    final posts = rawList.map((json) {
      final map = json as Map<String, dynamic>;
      final id = map['id'] as int;
      final isRead = readIds.contains(id);
      return PostModel.fromJson(map, isRead: isRead);
    }).toList();

    await localStorageService.cachePosts(posts);
    return posts;
  }

  Future<PostModel> getPostDetail(int id) async {
    final json = await apiService.getPostDetail(id);
    return PostModel.fromJson(json);
  }

  Future<void> updateReadStatus(List<PostModel> posts) async {
    final readIds = posts.where((p) => p.isRead).map((p) => p.id).toList();
    await localStorageService.saveReadPostIds(readIds);
    await localStorageService.cachePosts(posts);
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../local/local_database.dart';
import '../models/post_model.dart';
import '../../core/error/app_exceptions.dart';

class LocalStorageService {
  static const String _postsKey = 'cached_posts';
  static const String _readIdsKey = 'read_post_ids';

  final LocalDatabase localDatabase;

  LocalStorageService({required this.localDatabase});

  SharedPreferences get _prefs => localDatabase.prefs;

  Future<void> cachePosts(List<PostModel> posts) async {
    final jsonList = posts.map((p) => p.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    final success = await _prefs.setString(_postsKey, jsonString);
    if (!success) {
      throw CacheException('Failed to cache posts');
    }
  }

  Future<List<PostModel>> getCachedPosts() async {
    final jsonString = _prefs.getString(_postsKey);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
    final readIds = await getReadPostIds();

    return jsonList.map((json) {
      final map = json as Map<String, dynamic>;
      final id = map['id'] as int;
      final isRead = readIds.contains(id);
      return PostModel.fromJson(map, isRead: isRead);
    }).toList();
  }

  Future<void> saveReadPostIds(List<int> ids) async {
    final List<String> idsAsString = ids.map((e) => e.toString()).toList();
    final success = await _prefs.setStringList(_readIdsKey, idsAsString);
    if (!success) {
      throw CacheException('Failed to save read post ids');
    }
  }

  Future<List<int>> getReadPostIds() async {
    final idsAsString = _prefs.getStringList(_readIdsKey);
    if (idsAsString == null) return [];
    return idsAsString.map((e) => int.tryParse(e) ?? 0).toList();
  }
}

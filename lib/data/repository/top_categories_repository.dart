import 'package:spring_service/data/data_providers/fetch_top_categories.dart';
import 'package:spring_service/data/models/category_model.dart';

class TopCategoriesRepository {
  final FetchTopCategories fetchTopCategories;

  TopCategoriesRepository(this.fetchTopCategories);

  Future<List<CategoryModel>> topCategories() async {
    return await fetchTopCategories.fetchTopCategories();
  }
}

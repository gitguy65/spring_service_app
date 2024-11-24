import 'package:spring_service/data/data_providers/fetch_top_categories_data.dart';
import 'package:spring_service/data/models/category_model.dart';

class TopStaffRepository {
  final FetchTopCategories fetchTopStaff;

  TopStaffRepository(this.fetchTopStaff);

  Future<List<CategoryModel>> topCategories() async {
    return await fetchTopStaff.fetchTopCategories();
  }
}

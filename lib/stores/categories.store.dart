import 'package:mobx/mobx.dart';

import '../data/network/repositories/category_repository.dart';
import '../models/Category.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoryRepository _repository = new CategoryRepository();

  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addCategory(Category category) {
    categories.add(category);
  }

  @action
  void removCategory(Category category) {
    categories.remove(category);
  }

  @action
  void clearCategories() {
    categories.clear();
  }

  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);
    clearCategories();

    final response = await _repository.getCategories(tokenCompany);
    setLoading(false);

    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();
    setLoading(false);
  }
}

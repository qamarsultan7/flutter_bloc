import 'package:flutter_blo/Models/fav_items_model.dart';

class FavItemsRepository {
  Future<List<FavItemsModel>> fetchList() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    return List.of(_generateList(10));
  }

  List<FavItemsModel> _generateList(int length) {
    return List.generate(
        length, (index) => FavItemsModel(id: index, value: 'itme $index'));
  }
}

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blo/Models/fav_items_model.dart';
import 'package:flutter_blo/Repository/fav_items_repository.dart';

part 'favourite_itms_bloc_event.dart';
part 'favourite_itms_bloc_state.dart';

class FavouriteItmsBlocBloc
    extends Bloc<FavouriteItmsBlocEvent, FavouriteItmsBlocState> {
  FavItemsRepository favItemsRepository;
  List<FavItemsModel> itemsList = [];
  FavouriteItmsBlocBloc(this.favItemsRepository)
      : super(FavouriteItmsBlocState()) {
    on<FetchFavouriteItmsList>(fetchList);
    on<AddFavouriteItmsList>(_addfav);
    on<DeletingFavouriteItmsList>(_removeitem);
  }

  void fetchList(FetchFavouriteItmsList event,
      Emitter<FavouriteItmsBlocState> emitter) async {
    itemsList = await favItemsRepository.fetchList();
    emit(state.copyWith(
        itemsList: List.from(itemsList), listStatus: ListStatus.sussess));
  }

  void _addfav(
      AddFavouriteItmsList event, Emitter<FavouriteItmsBlocState> emitter) {
    int index = itemsList.indexWhere((element) => element.id == event.Item.id);
    itemsList[index] = event.Item;
    emit(state.copyWith(itemsList: List.from(itemsList)));
  }

  void _removeitem(DeletingFavouriteItmsList event,
      Emitter<FavouriteItmsBlocState> emitter) {
    for (int i = 0; i < event.index.length; i++) {
      itemsList.remove(event.index[i]);
    }

    emit(state.copyWith(itemsList: List.from(itemsList)));
  }
}

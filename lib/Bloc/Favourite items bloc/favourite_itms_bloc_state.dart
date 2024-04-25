// ignore_for_file: must_be_immutable

part of 'favourite_itms_bloc_bloc.dart';

enum ListStatus { loading, sussess, failure }

class FavouriteItmsBlocState extends Equatable {
  List<FavItemsModel> itemsList;
 
  final ListStatus listStatus;
  FavouriteItmsBlocState(
      {this.itemsList = const [], this.listStatus = ListStatus.loading});

  FavouriteItmsBlocState copyWith(
      {List<FavItemsModel>? itemsList, final ListStatus? listStatus,}) {
    return FavouriteItmsBlocState(
        itemsList: itemsList ?? this.itemsList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [listStatus, itemsList];
}

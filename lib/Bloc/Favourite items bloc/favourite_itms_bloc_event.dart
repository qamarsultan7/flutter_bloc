// ignore_for_file: non_constant_identifier_names, must_be_immutable

part of 'favourite_itms_bloc_bloc.dart';

sealed class FavouriteItmsBlocEvent extends Equatable {
  const FavouriteItmsBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteItmsList extends FavouriteItmsBlocEvent {}

class AddFavouriteItmsList extends FavouriteItmsBlocEvent {
  FavItemsModel Item;
  AddFavouriteItmsList({required this.Item});
}

class DeletingFavouriteItmsList extends FavouriteItmsBlocEvent {
 final List<Object> index;
 const DeletingFavouriteItmsList({required this.index});
  @override
  List<Object> get props => [index];
}

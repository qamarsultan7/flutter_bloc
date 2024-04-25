import 'package:equatable/equatable.dart';

class FavItemsModel extends Equatable {
  final int id;
  final String value;
  final bool isFavourite;
  final bool isDeleting;
  const FavItemsModel({
    required this.id,
    required this.value,
    this.isFavourite = false,
    this.isDeleting = false,
  });

  FavItemsModel coPywith({
    int? id,
    String? value,
    bool? isFavourite,
    bool? isDeleting,
  }) {
    return FavItemsModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [id, value, isFavourite, isDeleting];
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blo/Bloc/Favourite%20items%20bloc/favourite_itms_bloc_bloc.dart';
import 'package:flutter_blo/Models/fav_items_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavItems extends StatefulWidget {
  const FavItems({Key? key}) : super(key: key);

  @override
  _FavItemsState createState() => _FavItemsState();
}

class _FavItemsState extends State<FavItems> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteItmsBlocBloc>().add(FetchFavouriteItmsList());
  }

  bool showdeleting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav Items'),
        actions: [
          BlocBuilder<FavouriteItmsBlocBloc, FavouriteItmsBlocState>(
            buildWhen: (previous, current) => current != previous,
            builder: (context, state) {
              List<Object> indexxx = [];
              bool bisible = false;
              for (int i = 0; i < state.itemsList.length; i++) {
                if (state.itemsList[i].isDeleting) {
                  bisible = true;
                  indexxx.add(state.itemsList[i]);
                }
              }
              return Visibility(
                visible: bisible,
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<FavouriteItmsBlocBloc>()
                        .add(DeletingFavouriteItmsList(index: indexxx));
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<FavouriteItmsBlocBloc, FavouriteItmsBlocState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const CircularProgressIndicator();
              case ListStatus.failure:
                return const Text('Something wnet wrong');
              case ListStatus.sussess:
                if (state.itemsList.isNotEmpty) {
                  return ListView.builder(
                      itemCount: state.itemsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                                value: state.itemsList[index].isDeleting,
                                onChanged: (val) {
                                  FavItemsModel item = FavItemsModel(
                                      id: state.itemsList[index].id,
                                      value: state.itemsList[index].value,
                                      isDeleting: val!,
                                      isFavourite:
                                          state.itemsList[index].isFavourite);
                                  context
                                      .read<FavouriteItmsBlocBloc>()
                                      .add(AddFavouriteItmsList(Item: item));
                                }),
                            title: Text(state.itemsList[index].value),
                            trailing: GestureDetector(
                                onTap: () {
                                  FavItemsModel item = FavItemsModel(
                                    id: state.itemsList[index].id,
                                    value: state.itemsList[index].value,
                                    isDeleting:
                                        state.itemsList[index].isDeleting,
                                    isFavourite:
                                        state.itemsList[index].isFavourite
                                            ? false
                                            : true,
                                  );

                                  context
                                      .read<FavouriteItmsBlocBloc>()
                                      .add(AddFavouriteItmsList(Item: item));
                                },
                                child: Icon(state.itemsList[index].isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_outline)),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text('There is nothing in'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

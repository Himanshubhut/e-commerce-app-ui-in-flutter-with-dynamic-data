import 'package:flutter/material.dart';
import 'package:nyntra/providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finallist = provider.favorite;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text(
                  "Favorite",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: finallist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              finallist.removeAt(index);
                              setState(() {});
                            },
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          )
                        ]),
                        child: ListTile(
                          title: Text(
                            finallist[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            finallist[index].descripation,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage(finallist[index].image),
                              backgroundColor: Colors.blueAccent),
                          trailing: Text(
                            '\$${finallist[index].price}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          tileColor: Color.fromARGB(255, 240, 238, 238),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

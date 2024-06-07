import 'package:elden_ring_bosses/datas.dart';
import 'package:flutter/material.dart';

import 'boss.dart';
import 'boss_details_page.dart';

class BossesListPage extends StatefulWidget{

  @override
  State<BossesListPage> createState() => _BossesListPageState();
}

class _BossesListPageState extends State<BossesListPage>{

  List<Boss> listeDeBoss = Datas().bosses;

  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Les boss d'Elden Ring",
          style: TextStyle(
            color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: orientation == Orientation.portrait ? bossesList() : bossesGrid(),
      ),
    );
  }

  Widget bossesList() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
              listeDeBoss[index].name,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
          ),
          trailing: CircleAvatar(
            radius: 25,
            foregroundImage: AssetImage(
              listeDeBoss[index].getImage(),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BossDetailsPage(
                    boss: listeDeBoss[index],
                  )),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.amber,
          thickness: 1,
        );
      },
      itemCount: listeDeBoss.length,
    );
  }

  Widget bossesGrid() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: MediaQuery.of(context).size.width / 4),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
              color: Colors.black87,
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 65,
                    foregroundImage: AssetImage(
                      listeDeBoss[index].getImage(),
                    ),
                  ),
                  Text(listeDeBoss[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BossDetailsPage(
                      boss: listeDeBoss[index],
                    )),
              );
            },
          );
        },
        itemCount: listeDeBoss.length,
    );
  }
}

import 'package:flutter/material.dart';
import '../export.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: height(context, 0.8),
        width: width(context, 1),
        child: dashBody(context),
      )),
    );
  }
}

Widget drawerMenu(context) {
  _onDashBoard() => debugPrint('dash Board TOP');
  _onProduits() => debugPrint('dash Board TOP');
  _onAddProducts() => debugPrint('dash Board TOP');
  _onRemouveProduct() => debugPrint('dash Board TOP');
  _onTransaction() => debugPrint('dash Board TOP');
  _onRestore() => debugPrint('dash Board TOP');

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/sale.png',
                height: 100,
              ),
              const Text(
                'Atelog POS',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              const Text(
                'La gestion de stock de vos produits',
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 209, 222, 249)),
              )
            ],
          ),
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        drawerItem(context, 'Table de bord', Icons.dashboard_customize_rounded,
            _onDashBoard, Colors.blue),
        drawerItem(context, 'Les Produits', Icons.gpp_good_rounded, _onProduits,
            Colors.blue),
        drawerItem(context, 'Entrer un Produit', Icons.add_circle,
            _onAddProducts, Colors.blue),
        drawerItem(context, 'Sortir un Produit', Icons.remove_circle,
            _onRemouveProduct, Colors.blue),
        drawerItem(context, 'Les Transactions', Icons.list_outlined,
            _onTransaction, Colors.blue),
        drawerItem(context, 'Rupture de Stock', Icons.add_alert_sharp,
            _onTransaction, Colors.blue),
        drawerItem(context, 'Backup & Restore', Icons.data_saver_on, _onRestore,
            Colors.orange),
        drawerItem(
            context, 'Paremètres', Icons.settings, _onRestore, Colors.blue),
        drawerItem(context, 'Version Pro', Icons.card_giftcard, _onRestore,
            Colors.red),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 0.6,
              color: const Color.fromARGB(255, 186, 185, 185),
            ))
      ],
    ),
  );
}

Widget drawerItem(context, title, icon, event, color) {
  return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 14, top: 2),
      child: GestureDetector(
        onTap: event,
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              child: Icon(
                icon,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(7)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 2, top: 2),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ));
}

Widget dashBody(context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyOne(context),
        const Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'Les dernieres Transactions',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        bodyTwo(context),
        SizedBox(
          height: height(context, 0.072),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: null,
                child: const Text(
                  'Transaction Vente',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
              ),
              OutlinedButton(
                onPressed: null,
                child: const Text(
                  'Approvionnement',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget bodyOne(context) {
  return SizedBox(
    height: height(context, 0.14),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        height: height(context, 0.08),
        width: height(context, 0.09),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '55',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'RPODUITS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      Container(
        height: height(context, 0.08),
        width: height(context, 0.09),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '45',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'VENTES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      Container(
        height: height(context, 0.08),
        width: height(context, 0.09),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '35',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'ENTREES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      Container(
        height: height(context, 0.08),
        width: height(context, 0.09),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 201, 133, 24),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '05',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'EN STOCK',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ]),
  );
}

Widget bodyTwo(context) {
  return Expanded(
      child: Container(
          color: const Color.fromARGB(31, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)),
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.shopping_cart_checkout,
                            color: Color.fromARGB(221, 143, 142, 142),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Lundi,15 mai,2022 - 08:03',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black38),
                              ),
                              const Text(
                                'Hand sac women',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text('Quantité (6)',
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Text('PU (600 FC)',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Text('PT (3600 FC)',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                }),
          )));
}

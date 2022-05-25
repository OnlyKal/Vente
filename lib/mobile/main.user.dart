import 'package:flutter/material.dart';
import '../export.dart';

class MainUser extends StatefulWidget {
  const MainUser({Key? key}) : super(key: key);

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: height(context, 1),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/shop.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.6), BlendMode.dstATop))),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
                    width: width(context, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Prendre en charge',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'une meuilleure gestion du commerce',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ))),
            Container(
              height: height(context, 0.3),
              width: width(context, 1),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(34),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Suivez bien les processus indiqués ci-bas pour commencer...',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      width: width(context, 1),
                      height: 41,
                      child: OutlinedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/user/signin'),
                        child: const Text(
                          'Connexion',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/user/signup'),
                      child: SizedBox(
                          width: width(context, 1),
                          child: const Text(
                            'Créer un compte',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

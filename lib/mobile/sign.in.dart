import 'package:flutter/material.dart';
import '../export.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscurPW = true;
  void onTapPassWord() => setState(() => _obscurPW = !_obscurPW);

  TextEditingController fullName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  final DbProvider _db = DbProvider();

  @override
  void initState() {
    super.initState();
  }

  void signIn() async {
    var userInfos = await _db.getUserData('tUser');
    var checkuser = userInfos.where((user) =>
        user.fullname.toString() == fullName.text &&
        user.password.toString() == passWord.text);

    if (checkuser.length == 1) {
      Navigator.pushNamed(context, '/main');

      checkuser.forEach((user) {
        debugPrint(
            '${user.fullname} ${user.email} ${user.phone} ${user.userid} ${user.role}');
      });
    } else {
      errorToaster("Désolé, erreur d'authentification,réessayer !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SizedBox(
        height: height(context, 0.9),
        width: width(context, 1),
        child: Column(
          children: [
            Container(
              height: height(context, 0.38),
              width: width(context, 1),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: const AssetImage('assets/shop.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.6), BlendMode.dstATop)),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(23),
                      child: Text(
                        'Connectez-vous au compte existant !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ]),
            ),
            Container(
              height: height(context, 0.5),
              width: width(context, 1),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: fullName,
                    decoration: const InputDecoration(
                      label: Text(
                        "Noms d'utilisateur ",
                        style: TextStyle(fontSize: 14),
                      ),
                      hintText: 'John Doe',
                      hintStyle: TextStyle(fontSize: 12),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: passWord,
                    obscureText: _obscurPW,
                    decoration: InputDecoration(
                        label: const Text(
                          'Votre mot de passe',
                          style: TextStyle(fontSize: 14),
                        ),
                        hintText: '',
                        hintStyle: const TextStyle(fontSize: 12),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: onTapPassWord,
                          child: Icon(_obscurPW == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    width: width(context, 1),
                    height: 41,
                    child: OutlinedButton(
                      onPressed: () => signIn(),
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
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                      width: width(context, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Voulez-vous créer un compte ?  ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/user/signup'),
                            child: const Text(
                              ' Créer compte !',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )),
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}

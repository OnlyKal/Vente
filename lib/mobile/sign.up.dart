import 'package:flutter/material.dart';
import '../export.dart';
import 'package:uuid/uuid.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final DbProvider _db = DbProvider();

  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController mailAddress = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController passWord = TextEditingController();

  void signUp() async {
    if (confirmPassword.text == passWord.text) {
      var userId = '';
      var uuid = const Uuid();
      userId = uuid.v1();
      final userData = UserModel(
          userid: userId,
          fullname: fullName.text,
          password: passWord.text,
          phone: phoneNumber.text,
          email: mailAddress.text,
          role: 'role');
      _db.addData(userData, 'tUser');

      var userInfos = await _db.getUserData('tUser');
      var checkuser = userInfos.where((element) => element.userid == userId);

      if (checkuser.length == 1) {
        successToaster('Le compte est crée avec succès !');
        Navigator.pushNamed(context, '/main');
      } else {
        errorToaster('Désolé, erreur création du compte');
      }
    } else {
      errorToaster('Désolé, les deux mots de passe ne sont similaires !');
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
              height: height(context, 0.24),
              width: width(context, 1),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: const AssetImage('assets/shop.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.6), BlendMode.dstATop)),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 45),
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
                        "Créer un nouveau compte d'utilisateur !",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ]),
            ),
            Expanded(
                child: Container(
              width: width(context, 1),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(children: [
                  input("Noms de l'utilisateur", 'John Doe', fullName),
                  input('Numéro de télephone', '+243971777188', phoneNumber),
                  input('Addresse mail', 'johndoe@gmail.com', mailAddress),
                  inputPass('Mot de passe', '', passWord),
                  inputPass('Confirmer mot de passe', '', confirmPassword),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width(context, 1),
                    height: 41,
                    child: OutlinedButton(
                      onPressed: () => signUp(),
                      child: const Text(
                        'Créer compte',
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
                    height: 31,
                  ),
                  SizedBox(
                      width: width(context, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Avez vous déjà un compte ?  ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/user/signin'),
                            child: const Text(
                              ' Connectez vous ! ',
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
            ))
          ],
        ),
      )),
    );
  }
}

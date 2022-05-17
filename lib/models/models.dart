class UserModel {
  final String userid;
  final String fullname;
  final String password;
  final String phone;
  final String email;
  final String role;

  UserModel(
      {required this.userid,
      required this.fullname,
      required this.password,
      required this.phone,
      required this.email,
      required this.role});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'fullname': fullname,
      'password': password,
      'phone': phone,
      'email': email,
      'role': role
    };
  }
}

class ConfigModel {
  final String configId;
  final String configName;
  final String configValue;

  ConfigModel(
      {required this.configId,
      required this.configName,
      required this.configValue});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'configId': configId,
      'configName': configName,
      'configValue': configValue
    };
  }
}

class ExerciceModel {
  final String exeId;
  final String exeStart;
  final String exeEnd;
  final String exeStatus;
  final String exeName;

  ExerciceModel(
      {required this.exeId,
      required this.exeStart,
      required this.exeEnd,
      required this.exeStatus,
      required this.exeName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exeId': exeId,
      'exeStart': exeStart,
      'exeEnd': exeEnd,
      'exeStatus': exeStatus,
      'exeName': exeName
    };
  }
}

class DeviseModel {
  final String deviseId;
  final String deviseName;
  final String deviseSymbol;

  DeviseModel(
      {required this.deviseId,
      required this.deviseName,
      required this.deviseSymbol});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviseId': deviseId,
      'deviseName': deviseName,
      'deviseSymbol': deviseSymbol
    };
  }
}

class ProductModel {
  final String proId;
  final String proName;
  final String proCategory;
  final String proMark;

  ProductModel(
      {required this.proId,
      required this.proName,
      required this.proCategory,
      required this.proMark});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proId': proId,
      'proName': proName,
      'proCategory': proCategory,
      'proMark': proMark
    };
  }
}

class ProvideModel {
  final String proId;
  final String proDate;
  final String proDateOp;
  final String proCost;
  final String proDevise;
  final String proUser;

  ProvideModel(
      {required this.proId,
      required this.proDate,
      required this.proDateOp,
      required this.proCost,
      required this.proDevise,
      required this.proUser});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proId': proId,
      'proDate': proDate,
      'proDateOp': proDateOp,
      'proCost': proCost,
      'proDevise': proDevise,
      'proUser': proUser
    };
  }
}
class StockModel {
  final String stockId;
  final String productId;
  final String provideId;
  final String stockCode;
  final String stockDevise;
  final String stockQte;
  final String stockPU;
  final String stockDateOp;
  final String stockDateExp;
  final String stockLotNum;
  

  StockModel(
      {required this.stockId,
      required this.productId,
      required this.provideId,
      required this.stockCode,
      required this.stockDevise,
      required this.stockQte,
      required this.stockPU,
      required this.stockDateOp,
      required this.stockDateExp,
      required this.stockLotNum,
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stockId': stockId,
      'productId': productId,
      'provideId': provideId,
      'stockCode': stockCode,
      'stockDevise': stockDevise,
      'stockQte': stockQte,
      'stockPU': stockPU,
      'stockDateOp': stockDateOp,
      'stockDateExp': stockDateExp,
      'stockLotNum': stockLotNum,

    };
  }
}

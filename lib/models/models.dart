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
  final String proCatId;
  final String productMark;

  ProductModel(
      {required this.proId,
      required this.proName,
      required this.proCatId,
      required this.productMark});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proId': proId,
      'proName': proName,
      'proCatId': proCatId,
      'productMark': productMark
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
  final String stockProductId;
  final String provideId;
  final String stockCode;
  final String stockDevise;
  final String stockQte;
  final String stockPU;
  final String stockPT;
  final String stockDateOp;
  final String stockDateExp;
  final String stockLotNum;
  final String stockUserId;

  StockModel({
    required this.stockId,
    required this.stockProductId,
    required this.provideId,
    required this.stockCode,
    required this.stockDevise,
    required this.stockQte,
    required this.stockPU,
    required this.stockPT,
    required this.stockDateOp,
    required this.stockDateExp,
    required this.stockLotNum,
    required this.stockUserId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stockId': stockId,
      'stockProductId': stockProductId,
      'stockCode': stockCode,
      'stockDevise': stockDevise,
      'stockQte': stockQte,
      'stockPU': stockPU,
      'stockPT': stockPT,
      'stockDateOp': stockDateOp,
      'stockDateExp': stockDateExp,
      'stockLotNum': stockLotNum,
      'stockUserId': stockUserId,
    };
  }
}

class SellModel {
  final String sellId;
  final String sellStockId;
  final String sellDevise;
  final String sellFactureId;
  final String sellUnity;
  final String sellQte;
  final String sellPU;
  final String sellPT;
  final String sellDateOp;
  final String sellPaidStatus;

  SellModel(
      {required this.sellId,
      required this.sellStockId,
      required this.sellDevise,
      required this.sellFactureId,
      required this.sellUnity,
      required this.sellQte,
      required this.sellPU,
      required this.sellPT,
      required this.sellDateOp,
      required this.sellPaidStatus
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sellId': sellId,
      'sellStockId': sellStockId,
      'sellDevise': sellDevise,
      'sellFactureId': sellFactureId,
      'sellUnity': sellUnity,
      'sellQte': sellQte,
      'sellPU': sellPU,
      'sellPT': sellPT,
      'sellDateOp': sellDateOp,
      'sellPaidStatus': sellPaidStatus
    };
  }
}

// class FactureModel {
//   final String factureId;
//   final String facClient;
//   final String facCode;
//   final String facDateOp;
//   final String facDescription;
//   final String facExeId;
//   final String facUserId;


//   FactureModel(
//       {required this.factureId,
//       required this.facClient,
//       required this.facCode,
//       required this.facDateOp,
//       required this.facDescription,
//       required this.facExeId,
//       required this.facUserId,
// });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'factureId': factureId,
//       'facClient': facClient,
//       'facCode': facCode,
//       'facDateOp': facDateOp,
//       'facDescription': facDescription,
//       'facExeId': facExeId,
//       'facUserId': facUserId,
//     };
//   }
// }

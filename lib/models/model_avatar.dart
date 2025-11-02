import 'package:PiliPlus/models/model_owner.dart';

class Avatar extends Owner {
  Pendant? pendant;
  BaseOfficialVerify? officialVerify;
  Vip? vip;

  Avatar.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['pendant'] != null) pendant = Pendant.fromJson(json['pendant']);
    if (json['official_verify'] != null) {
      officialVerify = BaseOfficialVerify.fromJson(json['official_verify']);
    }
    if (json['vip'] != null) vip = Vip.fromJson(json['vip']);
  }
}

class Pendant {
  String? image;

  Pendant.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}

class BaseOfficialVerify {
  int? type;
  String? desc;

  BaseOfficialVerify.fromJson(Map<String, dynamic> json) {
    try {
      type = json['type'] is String ? int.tryParse(json['type']) : json['type'];
      desc = json['desc'];
    } catch (e) {
      print('❌ [BaseOfficialVerify] type 类型转换异常: $e');
      type = null;
    }
  }
}

class Vip {
  int? type;
  late int status;
  Label? label;

  Vip.fromJson(Map<String, dynamic> json) {
    try {
      type = (json['type'] ?? json['vipType']) is String 
          ? int.tryParse(json['type'] ?? json['vipType']) 
          : json['type'] ?? json['vipType'];
      status = (json['status'] ?? json['vipStatus'] ?? 0) is String
          ? int.tryParse(json['status'] ?? json['vipStatus'] ?? '0') ?? 0
          : json['status'] ?? json['vipStatus'] ?? 0;
      if (json['label'] != null) label = Label.fromJson(json['label']);
    } catch (e) {
      print('❌ [Vip] VIP信息类型转换异常: $e');
      type = null;
      status = 0;
    }
  }
}

class Label {
  String? text;

  Label.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}

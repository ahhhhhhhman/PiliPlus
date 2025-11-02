import 'package:PiliPlus/models/model_video.dart';
import 'package:hive/hive.dart';

part 'model_owner.g.dart';

@HiveType(typeId: 3)
class Owner implements BaseOwner {
  Owner({
    this.mid,
    this.name,
    this.face,
  });
  @HiveField(0)
  @override
  int? mid;
  @HiveField(1)
  @override
  String? name;
  @HiveField(2)
  String? face;

  Owner.fromJson(Map<String, dynamic> json) {
    try {
      if (json["mid"] is String) {
        String midStr = json["mid"];
        mid = int.tryParse(midStr);
        if (mid == null) {
          print('❌ [Owner] mid 类型转换失败: $midStr (类型: ${midStr.runtimeType})');
        }
      } else {
        mid = json["mid"];
      }
    } catch (e) {
      print('❌ [Owner] mid 处理异常: $e');
      mid = null;
    }
    name = json["name"];
    face = json['face'];
  }
}

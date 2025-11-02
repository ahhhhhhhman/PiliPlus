abstract class BaseSimpleVideoItemModel {
  late String title;
  String? bvid;
  int? cid;
  String? cover;
  int duration = -1;
  late BaseOwner owner;
  late BaseStat stat;
}

abstract class BaseVideoItemModel extends BaseSimpleVideoItemModel {
  int? aid;
  String? desc;
  int? pubdate;
  bool isFollowed = false;
}

abstract class BaseOwner {
  int? mid;
  String? name;
}

abstract class BaseStat {
  int? view;
  int? like;
  int? danmu;
}

class Stat extends BaseStat {
  Stat.fromJson(Map<String, dynamic> json) {
    try {
      view = json["view"] is String ? int.tryParse(json["view"]) : json["view"];
      like = json["like"] is String ? int.tryParse(json["like"]) : json["like"];
      danmu = json['danmaku'] is String ? int.tryParse(json['danmaku']) : json['danmaku'];
    } catch (e) {
      print('❌ [Stat] 统计数据类型转换异常: $e');
      view = null;
      like = null;
      danmu = null;
    }
  }
}

class PlayStat extends BaseStat {
  PlayStat.fromJson(Map<String, dynamic> json) {
    try {
      view = json['play'] is String ? int.tryParse(json['play']) : json['play'];
      danmu = json['danmaku'] is String ? int.tryParse(json['danmaku']) : json['danmaku'];
    } catch (e) {
      print('❌ [PlayStat] 播放统计类型转换异常: $e');
      view = null;
      danmu = null;
    }
  }
}

class Dimension {
  int? width;
  int? height;
  int? rotate;

  Dimension.fromJson(Map<String, dynamic> json) {
    try {
      width = json["width"] is String ? int.tryParse(json["width"]) : json["width"];
      height = json["height"] is String ? int.tryParse(json["height"]) : json["height"];
      rotate = json["rotate"] is String ? int.tryParse(json["rotate"]) : json["rotate"];
    } catch (e) {
      print('❌ [Dimension] 尺寸信息类型转换异常: $e');
      width = null;
      height = null;
      rotate = null;
    }
  }
}

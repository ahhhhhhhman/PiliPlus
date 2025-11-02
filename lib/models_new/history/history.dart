class History {
  int? oid;
  int? epid;
  String? bvid;
  int? page;
  int? cid;
  String? part;
  String? business;
  int? dt;

  History({
    this.oid,
    this.epid,
    this.bvid,
    this.page,
    this.cid,
    this.part,
    this.business,
    this.dt,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    try {
      int? cid;
      if (json['cid'] is String) {
        cid = int.tryParse(json['cid']);
        cid = cid == 0 ? null : cid;
      } else {
        cid = json['cid'] == 0 ? null : json['cid'];
      }
      
      return History(
        oid: json['oid'] is String ? int.tryParse(json['oid']) : json['oid'],
        epid: json['epid'] is String ? int.tryParse(json['epid']) : json['epid'],
        bvid: json['bvid'],
        page: json['page'] is String ? int.tryParse(json['page']) : json['page'],
        cid: cid,
        part: json['part'],
        business: json['business'],
        dt: json['dt'] is String ? int.tryParse(json['dt']) : json['dt'],
      );
    } catch (e) {
      print('❌ [History] 历史记录类型转换异常: $e');
      return History(
        oid: null,
        epid: null,
        bvid: json['bvid'],
        page: null,
        cid: null,
        part: json['part'],
        business: json['business'],
        dt: null,
      );
    }
  }
}

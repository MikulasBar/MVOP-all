
class SatteliteInfo {
  final int id;
  final bool visible;
  final SatteliteEvent rise;
  final SatteliteEvent culmination;
  final SatteliteEvent set;

  SatteliteInfo({
    required this.id,
    required this.visible,
    required this.rise,
    required this.culmination,
    required this.set,
  });

  static SatteliteInfo fromJson(List<dynamic> jsonList) {

    Map<String, dynamic> json = jsonList[0];
    Map<String, dynamic> rise = json['rise'];
    Map<String, dynamic> culmination = json['culmination'];
    Map<String, dynamic> set = json['set'];
  
    return SatteliteInfo(
      id: json['norad_id'],
      visible: json['visible'],
      rise: SatteliteEvent(
        alt: rise['alt'],
        azimuth: rise['az'],
        utcDatetime: DateTime.parse(rise['utc_datetime']),
        visible: rise['visible'],
      ),
      culmination: SatteliteEvent(
        alt: culmination['alt'],
        azimuth: culmination['az'],
        utcDatetime: DateTime.parse(culmination['utc_datetime']),
        visible: culmination['visible'],
      ),
      set: SatteliteEvent(
        alt: set['alt'],
        azimuth: set['az'],
        utcDatetime: DateTime.parse(set['utc_datetime']),
        visible: set['visible'],
      ),
    );
  }
}


class SatteliteEvent {
  final String alt;
  final String azimuth;
  final DateTime utcDatetime;
  final bool visible;

  SatteliteEvent({
    required this.alt,
    required this.azimuth,
    required this.utcDatetime,
    required this.visible,
  });
}
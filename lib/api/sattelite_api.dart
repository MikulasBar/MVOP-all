import 'package:geolocator/geolocator.dart';
import 'package:satellite_tracker/model/sattelite_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SatteliteApi {
  static Future<SatteliteInfo> fetchSatelliteInfo(String id, bool vis) async {
    const url = 'https://sat.terrestre.ar/passes/';
    const limit = '1';
    final position = await Geolocator.getCurrentPosition();
    final lat = position.latitude;
    final lon = position.longitude;
    final params = '?lat=$lat&lon=$lon&limit=$limit&visible_only=$vis';
    final response = await http.get(Uri.parse(url + id + params));
    // final response = http.Response('', 200);
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
      // List<dynamic> json = jsonDecode(testJson) as List<dynamic>;
      return SatteliteInfo.fromJson(json);
    } else {
      throw Exception('Failed to load satellite data');
    }
  }
}



// const String testJson = """
// [
//     {
//         "rise": {
//             "alt": "10.01",
//             "az": "196.30",
//             "az_octant": "S",
//             "utc_datetime": "2024-11-16 16:45:18.936128+00:00",
//             "utc_timestamp": 1731775518,
//             "is_sunlit": true,
//             "visible": true
//         },
//         "culmination": {
//             "alt": "22.38",
//             "az": "143.02",
//             "az_octant": "SE",
//             "utc_datetime": "2024-11-16 16:48:01.373670+00:00",
//             "utc_timestamp": 1731775681,
//             "is_sunlit": true,
//             "visible": true
//         },
//         "set": {
//             "alt": "9.99",
//             "az": "89.75",
//             "az_octant": "E",
//             "utc_datetime": "2024-11-16 16:50:44.552024+00:00",
//             "utc_timestamp": 1731775844,
//             "is_sunlit": false,
//             "visible": false
//         },
//         "visible": true,
//         "norad_id": 25544
//     }
// ]
// """;
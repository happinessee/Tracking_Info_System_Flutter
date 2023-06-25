class WebViewServices {
  static const String jsZoomIn = '''
  var level = map.getLevel();
  if (level > 6) {
  map.setLevel(level - 1);
  }
''';

  static const String jsZoomOut = '''
  var level = map.getLevel();
  if (level < 8) {
  map.setLevel(level + 1);
  }
''';

  static const String jsCircleFollowMarker = '''
    kakao.maps.event.addListener(marker, 'dragend', function() {
      circle.setPosition(marker.getPosition());
    });
''';

  static const String jsMarkerDraggable = '''marker.setDraggable(true);''';

  static String jsSetMarkerPosition(double lat, double lng) {
    return '''
      var newLatLng = new kakao.maps.LatLng($lat, $lng);
      marker.setPosition(newLatLng);
    ''';
  }

  static String jsSetCirclePosition(double lat, double lng) {
    return '''
    var position = new kakao.maps.LatLng($lat, $lng);
    circle.setPosition(position);
''';
  }

  static String jsNewMarker(double lat, double lng) {
    return ''' 
      var marker_new = new kakao.maps.Marker({
      map: map,
      position: new kakao.maps.LatLng($lat, $lng)
      });
      var markerImage_new = new kakao.maps.MarkerImage(
      'https://pohgtvbqxwfm13607079.cdn.ntruss.com/red_dot.png',
      new kakao.maps.Size(17, 17), new kakao.maps.Point(10, 20));
      marker.setImage(markerImage_new);
    ''';
  }

  static String jsSetCircle(int radius, double lat, double lng) {
    return '''
    var circle = new kakao.maps.Circle({
      map: map,
      center: new kakao.maps.LatLng($lat, $lng),
      radius: $radius,
      strokeWeight: 1,
      strokeOpcity: 0.5,
      strokeStyle: 'dashed',
      fillColor: '#B2D3C2',
      fillOpacity: 0.25
    });
    circle.setMap(map);
''';
  }

  static String jsSetCircleRadius(int radius) {
    return '''
    circle.setRadius($radius);
''';
  }

  static String createPolyline = ''' 
    var polyline = new kakao.maps.Polyline({
      map: map,
      path: [],
      strokeWeight: 3,
      strokeColor: '#FF00FF',
      strokeOpacity: 0.8,
      strokeStyle: 'solid'
    });
  ''';

  static String setPolyline(List<LatLng> logList) {
    String tmp = '';
    for (int i = 0; i < logList.length; i++) {
      tmp += '''
            newPath.push(new kakao.maps.LatLng(${logList[i].lat}, ${logList[i].lng}));
            new kakao.maps.Marker({position: new kakao.maps.LatLng(${logList[i].lat}, ${logList[i].lng})}).setMap(map);
          ''';
    }
    return ''' 
      var newPath = [];
      $tmp
      polyline.setPath(newPath);
    ''';
  }
}

class LatLng {
  double lat;
  double lng;

  LatLng({required this.lat, required this.lng});
}

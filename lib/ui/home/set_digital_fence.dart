import 'dart:convert';

import 'package:capstone/main.dart';

import 'package:capstone/services/webview_services.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/consts/default.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SetDigitalFence extends StatefulWidget {
  const SetDigitalFence({super.key});

  @override
  State<SetDigitalFence> createState() => SetDigitalFenceState();
}

class SetDigitalFenceState extends State<SetDigitalFence> {
  static WebViewController? mapController;

  @override
  Widget build(BuildContext context) {
    _afterBuild();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: GColors.WHITE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          '화물 이동경로 확인',
          style: TextStyle(color: GColors.WHITE),
        ),
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
      ),
      body: FutureBuilder(
        future: addressToLatLng(),
        builder: (BuildContext context, AsyncSnapshot<List<LatLng>> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Column(
                  children: [
                    Flexible(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return KakaoMapView(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          kakaoMapKey: dotenv.env['KAKAO_WEB_API_KEY']!,
                          lat: 35.179514,
                          lng: 126.895387,
                          mapController: (controller) {
                            mapController = controller;
                          },
                          polyline: KakaoFigure(
                            path: [
                              for (int i = 0;
                                  i < snapshot.data!.length;
                                  i++) ...[
                                KakaoLatLng(
                                    lat: snapshot.data![i].lat,
                                    lng: snapshot.data![i].lng),
                              ]
                            ],
                            strokeColor: Colors.blue,
                            strokeWeight: 2.5,
                            strokeColorOpacity: 0.9,
                          ),
                          zoomLevel: 5,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> setMarkerPosition(double lat, double lng) async {
    if (mapController != null) {
      mapController!
          .runJavascript(WebViewServices.jsSetMarkerPosition(lat, lng));
    }
  }

  Future<void> tempTimer() async {}

  Future<List<LatLng>> addressToLatLng() async {
    final Uri url = Uri.https('apis-navi.kakaomobility.com', '/v1/directions', {
      'origin': '126.895387,35.179514',
      'destination': '126.90630221583885,35.1773905415073'
    });
    Map<String, String> headers =
        Default.KAKAO_HEADER(dotenv.get('KAKAO_REST_API_KEY'));
    http.Response response = await http.get(url, headers: headers);
    final List<LatLng> latLng = [];
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      for (int j = 0;
          j <
              (jsonResponse['routes'][0]['sections'][0]['roads'] as List)
                  .length;
          j++) {
        var latLngList = jsonResponse['routes'][0]['sections'][0]['roads'][j]
            ['vertexes'] as List;
        print(latLngList);
        for (int i = 0; i < latLngList.length / 2; i += 2) {
          latLng.add(LatLng(lng: latLngList[i], lat: latLngList[i + 1]));
        }
      }
      return latLng;
    }
    return latLng;
  }

  Future<void> _afterBuild() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _createPolyline();
  }

  Future<void> _createPolyline() async {
    if (mapController != null) {
      mapController!.runJavascript(WebViewServices.createPolyline);
    }
  }

  Future<void> _setPolyline(List<LatLng> latLng) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mapController != null) {
      mapController!.runJavascript(WebViewServices.setPolyline(latLng));
    }
  }

  Future<void> _setCircleRadius(int radius) async {
    if (mapController != null) {
      mapController!.runJavascript(WebViewServices.jsSetCircleRadius(radius));
    }
  }

  Future<void> _zoomIn() async {
    if (mapController != null) {
      mapController!.runJavascript(WebViewServices.jsZoomIn);
    }
  }

  Future<void> _zoomOut() async {
    if (mapController != null) {
      mapController!.runJavascript(WebViewServices.jsZoomOut);
    }
  }
}

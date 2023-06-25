import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';

import 'package:daum_postcode_search/daum_postcode_search.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => SearchAddressState();
}

class SearchAddressState extends State<SearchAddress> {
  bool isError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    DaumPostcodeSearch setSearchOption() {
      return DaumPostcodeSearch(
        onConsoleMessage: (_, message) => print(message),
        onLoadError: (controller, uri, errorCode, message) => setState(
          () {
            isError = true;
            errorMessage = message;
          },
        ),
        onLoadHttpError: (controller, uri, errorCode, message) => setState(
          () {
            isError = true;
            errorMessage = message;
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('주소를 검색해주세요.'),
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
      ),
      body: Column(
        children: [
          Expanded(
            child: setSearchOption(),
          ),
          Visibility(
            visible: isError,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(errorMessage ?? ""),
                ElevatedButton(
                  child: const Text("Refresh"),
                  onPressed: () {
                    setSearchOption().controller?.reload();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

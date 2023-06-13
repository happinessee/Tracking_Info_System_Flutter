import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_up_common.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpDriver extends StatelessWidget {
  SignUpDriver({super.key});

  final maskFormatter = MaskTextInputFormatter(mask: '### #### ####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.WHITE,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: GColors.BLACK,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: SignUpCommon(isPatient: true),
        ),
      ),
    );
  }
}

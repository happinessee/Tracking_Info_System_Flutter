import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:capstone/blocs/auth_message_state_cubit.dart';
import 'package:capstone/blocs/mobile_num_state_cubit.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/services/sign_up_services.dart';
import 'package:capstone/main.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final maskFormatter = MaskTextInputFormatter(mask: '### #### ####');

  Widget build(BuildContext context) {
    final authStatus = context.read<AuthMessageStateCubit>();
    final authWatch = context.watch<AuthMessageStateCubit>();
    final mobileStatus = context.read<MobileNumStateCubit>();
    final mobileWatch = context.watch<MobileNumStateCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const SizedBox(height: 10),
        const Text(
          '반갑습니다!\n로그인해주세요.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '컨테이너 추적 관리 시스템은'
          '회원의 개인 정보를 절대로 공개하지 않아요.',
          style: TextStyle(
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Form(
          child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(13),
                maskFormatter,
              ],
              decoration: InputDecoration(
                hintText: '아이디를 입력해주세요.',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                mobileStatus.changeNumber(value);
                if (value.length > 11) {
                  mobileStatus.mobileReady();
                } else {
                  mobileStatus.mobileNotReady();
                }
              }),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            if (mobileStatus.state == MobileNumState.mobileNumReady) {
              if (await SignUpServices.receiveSmsAuth(mobileStatus.number)) {
                authStatus.authNotSend();
              } else {
                ScaffoldMessenger.of(MyApp.navigatorKey.currentContext!)
                    .showSnackBar(
                  const SnackBar(
                    content: Text('중복된 아이디입니다.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: GColors.WHITE),
            child: Center(
              child: Text(
                authWatch.state == AuthMessageState.initial
                    ? '비밀번호 입력하기'
                    : '비밀번호 입력하기',
                style: TextStyle(
                  color: mobileWatch.state == MobileNumState.mobileNumReady
                      ? GColors.CRYPTOLAB_PURPLE
                      : GColors.GREY,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        authWatch.state != AuthMessageState.initial
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.MAIN);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: authStatus.state != AuthMessageState.authNumSend
                        ? GColors.GREY
                        : GColors.CRYPTOLAB_PURPLE,
                  ),
                  child: const Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: GColors.WHITE,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

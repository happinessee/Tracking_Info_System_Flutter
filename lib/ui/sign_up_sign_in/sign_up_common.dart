import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:capstone/blocs/auth_message_state_cubit.dart';
import 'package:capstone/blocs/mobile_num_state_cubit.dart';
import 'package:capstone/blocs/sign_up_input_name_cubit.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/services/sign_up_services.dart';
import 'package:capstone/main.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpCommon extends StatelessWidget {
  final maskFormatter = MaskTextInputFormatter(mask: '### #### ####');
  final bool isPatient;

  SignUpCommon({
    super.key,
    required this.isPatient,
  });

  @override
  Widget build(BuildContext context) {
    final authStatus = context.read<AuthMessageStateCubit>();
    final authWatch = context.watch<AuthMessageStateCubit>();
    final mobileStatus = context.read<MobileNumStateCubit>();
    final mobileWatch = context.watch<MobileNumStateCubit>();
    final nameStatus = context.read<SignUpInputNameCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const SizedBox(height: 10),
        const Text(
          '반갑습니다!\n사용할 아이디를 입력해주세요.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '입력하는 개인 정보는 최소한으로 줄였어요.\n'
          '개인 정보는 안전하게 보호되고 어디에도 공개되지 않아요.',
          style: TextStyle(
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Form(
          child: TextFormField(
              keyboardType: TextInputType.text,
              inputFormatters: [
                LengthLimitingTextInputFormatter(13),
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
                mobileStatus.mobileReady();
              }),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            authStatus.authNotSend();
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
                    ? '아이디 입력'
                    : '비밀번호 입력하기',
                style: TextStyle(
                  color: GColors.CRYPTOLAB_PURPLE,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        authWatch.state != AuthMessageState.initial
            ? Form(
                child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '비밀번호 입력하기',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      authStatus.changeAuthNumber(value);
                      if (value.isNotEmpty) {
                        authStatus.authSend();
                      } else {
                        authStatus.authNotSend();
                      }
                    }),
              )
            : const SizedBox(),
        const SizedBox(height: 10),
        authWatch.state != AuthMessageState.initial
            ? InkWell(
                onTap: _onTapByIsPatient(),
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
                      '다음',
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

  Future<void> _onTapPatient() async {
    final context = MyApp.navigatorKey.currentContext!;
    final authStatus = context.read<AuthMessageStateCubit>();

    authStatus.authCompleted();

    Navigator.of(context).pushNamed(Routes.SIGN_UP_COMPLETE);
  }

  Future<void> _onTapProtector() async {
    final context = MyApp.navigatorKey.currentContext!;
    final authStatus = context.read<AuthMessageStateCubit>();

    authStatus.authCompleted();
  }

  Future<void> Function() _onTapByIsPatient() {
    return _onTapPatient;
  }
}

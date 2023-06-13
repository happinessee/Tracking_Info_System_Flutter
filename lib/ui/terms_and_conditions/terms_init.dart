import 'package:flutter/material.dart';

import 'package:word_break_text/word_break_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:capstone/ui/terms_and_conditions/select_agreement.dart';
import 'package:capstone/blocs/terms_and_conditions_bloc.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/ui/terms_and_conditions/oval_buttons.dart';
import 'package:capstone/consts/routes.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => TermsScreenState();
}

class TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const SizedBox(height: 180),
            const WordBreakText(
              '원활한 서비스 사용을 위해',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const WordBreakText(
              '이용 약관에 동의해 주세요.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: GColors.FONTGRAY,
                  ),
                ),
              ),
              child: Row(
                children: [
                  BlocBuilder<AgreementCheckBloc, AgreementCheckState>(
                      builder: (context, state) {
                    return InkWell(
                      hoverColor: GColors.TRANSPARENT,
                      splashColor: GColors.TRANSPARENT,
                      onTap: () {
                        BlocProvider.of<AgreementCheckBloc>(context)
                            .add(AllChecked(
                          allSelect: !state.allSelect,
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: state.allSelect
                                ? GColors.SELECTED
                                : GColors.TRANSPARENT,
                            border: Border.all(
                              color: GColors.FONTBLACK,
                            ),
                          ),
                          child: Image.asset('assets/images/1.5x/1207.png',
                              color: state.allSelect
                                  ? GColors.WHITE
                                  : GColors.FONTGRAY),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(width: 5),
                  const Text(
                    '모두 동의',
                    style: TextStyle(
                      color: GColors.FONTBLACK,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            const AgreementComponent(
              popupText: '',
              titleText: '범동이 이용약관 동의(필수)',
              conditionNum: 0,
            ),
            const AgreementComponent(
              popupText: '',
              titleText: '개인정보 처리방침 동의(필수)',
              conditionNum: 1,
            ),
            const AgreementComponent(
              popupText: '',
              titleText: '위치정보 수집 이용 동의(필수)',
              conditionNum: 2,
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: BlocBuilder<AgreementCheckBloc, AgreementCheckState>(
                  builder: (context, state) {
                return OvalButton(
                    text: '다음',
                    fontColor:
                        (state.check()) ? GColors.BLACK : GColors.FONTGRAY,
                    borderColor:
                        (state.check()) ? GColors.SELECTED : GColors.FONTGRAY,
                    ontap: () async {
                      if (state.check()) {}
                    });
              }),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:capstone/blocs/sign_up_input_name_cubit.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/services/sign_up_services.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_up_common.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final maskFormatter = MaskTextInputFormatter(mask: '### #### ####');

  @override
  Widget build(BuildContext context) {
    final nameStatus = context.read<SignUpInputNameCubit>();
    final nameWatch = context.watch<SignUpInputNameCubit>();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SignUpCommon(isPatient: false),
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('마지막으로 이름을 입력해주세요.'),
                  const Text('이름은 이해하기 쉽게 별명을 추가하셔도 괜찮아요.'),
                  const Text('· 홍길동(해상물류)\n' '· 홍길순(동원해운)'),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '이름을 입력해주세요.',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => nameStatus.onChanged(value),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (nameStatus.state.isNotEmpty &&
                          await SignUpServices.signUpProtector(
                              nameStatus.state)) {
                        Navigator.of(context)
                            .popAndPushNamed(Routes.SIGN_UP_COMPLETE);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: nameWatch.state.isNotEmpty
                            ? GColors.CRYPTOLAB_PURPLE
                            : GColors.LIGHT_GREY,
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

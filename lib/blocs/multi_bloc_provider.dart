import 'package:capstone/blocs/auth_message_state_cubit.dart';
import 'package:flutter/material.dart';

import 'package:capstone/blocs/index.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider multiBlocProvider({required Widget child}) {
  return MultiBlocProvider(providers: [
    BlocProvider<MobileNumStateCubit>(
      create: (_) => MobileNumStateCubit(),
    ),
    BlocProvider<SignUpInputNameCubit>(
      create: (_) => SignUpInputNameCubit(),
    ),
    BlocProvider<AuthMessageStateCubit>(
      create: (_) => AuthMessageStateCubit(),
    ),
    BlocProvider<AgreementCheckBloc>(
      create: (_) => AgreementCheckBloc(),
    )
  ], child: child);
}

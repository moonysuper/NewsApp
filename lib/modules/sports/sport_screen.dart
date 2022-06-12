import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/component.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewCubit.get(context);
    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state){},
      builder: (context,state) =>department(cubit.sports),
    );
  }
}

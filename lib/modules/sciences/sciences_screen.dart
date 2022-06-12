import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/component.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewCubit.get(context);
    return BlocConsumer<NewCubit,NewStates>(
        builder:(context,state)=>department(cubit.science),
        listener: (context,state){},
    );
  }
}

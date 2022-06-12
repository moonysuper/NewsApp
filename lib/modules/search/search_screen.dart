import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/component.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = NewCubit.get(context);
        return Scaffold(

          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value)
                  {
                    cubit.getSearch(value);
                  },
                  controller:searchController ,
                  keyboardType: TextInputType.text,

                  validator: (String? value)
                  {
                    if(value!.isEmpty)
                      return "Search Must not Empty";
                    else
                      return null;
                  },
                    style: TextStyle(color: cubit.isDark ? Colors.white : Colors.black,),
                  decoration: InputDecoration(

                    fillColor: Colors.blue,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: cubit.isDark ? Colors.white : Colors.black,
                        width: 2.0,
                      )
                    ),
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",


                  )
                  ),

                ),

              Expanded(child: department(cubit.Search,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}

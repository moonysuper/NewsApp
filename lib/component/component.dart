import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/web_view/webview_screen.dart';

Widget buildartical(list,context,) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(list["url"])),);

  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${list['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text("${list['title']}",style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,)),
                Text("${list['publishedAt']}",style: TextStyle(color:Colors.grey ,fontWeight:FontWeight.bold ),)
              ],
            ),
          ),
        )
      ],
    ),
  ),
);
Widget divide() => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(

    color: Colors.grey,

    height: 2,

    width: double.infinity,

  ),
);
Widget department(list,{isSearch = false}) =>BlocConsumer<NewCubit,NewStates>(
  listener: (context, state) {  },
  builder: ( context,  state) => ConditionalBuilder(
    condition: list.length > 0  ,
    builder: (context ) => ListView.separated
      (
        physics: BouncingScrollPhysics(),
        itemBuilder:(context,index) => buildartical(list[index],context),
        separatorBuilder: (context,index) => divide(),
        itemCount: list.length),
    fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
  ),

);
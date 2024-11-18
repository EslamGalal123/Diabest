
import 'package:diiabest/feature/Home/presentatio/widgets/custom_home.dart';
import 'package:flutter/material.dart';
class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomScrollView(
                  physics:  BouncingScrollPhysics(),
                  slivers: [
                   SliverToBoxAdapter( child:CustomHome()),
                    
                    
                    ])),
        )) ;
  }
}
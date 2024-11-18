import 'package:diiabest/feature/pregnancy/presentation/widget/custom_pregnancy_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/Utils/App-TextStyles.dart';
class PregnancyView extends StatelessWidget {
  const PregnancyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Pregnancy', style: CustomTextStyles.lohit500style20),

        ),
        body: const SafeArea(

          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomScrollView(
                  physics:  BouncingScrollPhysics(),
                  slivers: [
                   SliverToBoxAdapter( child:CustomPregnancyForm()),
                    
                    
                    ])),
        )) ;
  }
}
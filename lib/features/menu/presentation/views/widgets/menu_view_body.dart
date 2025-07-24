import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reco_task/core/utils/constants.dart';
import 'package:reco_task/core/utils/show_snack_bar.dart';
import 'package:reco_task/features/menu/presentation/views/widgets/food_item.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference food = FirebaseFirestore.instance.collection(
      AppConstants.foodCollection,
    );
    return FutureBuilder<QuerySnapshot>(
      future: food.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.docs;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 4, 
            ),
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return FoodItem(item: item);
            },
          );
        } else if (snapshot.hasError) {
          log(snapshot.error.toString());
          showErrorSnackBar(snapshot.error.toString(), context);
          return SizedBox.shrink();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

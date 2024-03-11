import 'package:flutter/material.dart';
import 'package:flutter_zfcourier_crud_api/views/widgets/skeleton.dart';


class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Skeleton(width:double.infinity,height: 55,),
            SizedBox(height: 10),
            Skeleton(width:double.infinity,height: 55,),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}

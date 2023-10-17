import 'package:flutter/material.dart';

import 'package:kelapa_hakam/theme/color.dart';

class AppBarKelapaSection extends StatelessWidget {
  const AppBarKelapaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      surfaceTintColor: Colors.white,
      pinned: true,
      title: const Text('Kelapa'),
      centerTitle: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task/modules/search/search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchWidgets.appBar(),
    );
  }
}

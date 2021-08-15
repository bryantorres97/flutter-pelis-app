import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  // const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(),
              MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
      child: ListView.builder(
        itemBuilder: (_, int index) => _CastCard(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                height: 140,
                width: 100,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                  'https://via.placeholder.com/150x300',
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'actor.nameassdasdad sadadasdadadadaadsadsa',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

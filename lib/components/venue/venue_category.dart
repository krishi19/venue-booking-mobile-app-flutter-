import 'package:flutter/material.dart';

class VenueCategory extends StatelessWidget {
  final String category;
  final String imageUrl;

  const VenueCategory({
    Key key,
    @required this.category,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 150,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(category)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

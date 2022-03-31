import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({
    this.name,
    this.imageUrl,
  });

  @override
  List<Object> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
      name: snapshot['name'],
      imageUrl: snapshot['imgUrl'],
    );
    return category;
  }
}

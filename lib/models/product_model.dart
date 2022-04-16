import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    this.name,
    this.category,
    this.imageUrl,
    this.price,
    this.isRecommended,
    this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
    );
    return product;
  }

  @override
  List<Object> get props => [
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Product> products = const [
    // modelo para cosméticos
    Product(
      name: "Eau de Parfum",
      category: "Cosméticos",
      imageUrl: 
        "https://a-static.mlcdn.com.br/618x463/la-vie-est-belle-lancome-perfume-feminino-eau-de-parfum/epocacosmeticos-integra/7172/76af36cb71c8bc2f73097a5a82a863bf.jpg"
      ,
      price: 10.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Irresistible",
      category: "teste",
      imageUrl: "https://fraguru.com/mdimg/perfume/375x500.60891.jpg",
      price: 10.79,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: "Saint Lauren",
      category: "Cosméticos",
      imageUrl: 
        "https://epocacosmeticos.vteximg.com.br/arquivos/ids/375812-500-500/libre-yves-saint-laurent-perfume-feminino-eau-de-parfum-30ml.jpg?v=637188594756430000"
      ,
      price: 2.59,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "My Way",
      category: "Cosméticos",
      imageUrl: 
        "https://epocacosmeticos.vteximg.com.br/arquivos/ids/424461-500-500/my-way-giorgio-armani-perfume-feminino-edp-30ml.jpg?v=637515094182500000"
      ,
      price: 5.90,
      isRecommended: true,
      isPopular: true,
    ),
    // modelo para moda masculina
    Product(
      name: "Camisa Branca",
      category: "Moda Masculina",
      imageUrl: 
        "https://rlv.zcache.com.br/camisa_branca_lisa-rd31aff54d37c459ca43401eedbf54e07_k2gr0_540.jpg"
      ,
      price: 15.90,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: "Camisa Preta",
      category: "Moda Masculina",
      imageUrl: 
        "https://cf.shopee.com.br/file/71ad80f1c46275424f2f84cbe421537c"
      ,
      price: 13.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Jaqueta Jeans",
      category: "Moda Masculina",
      imageUrl: 
        "https://lojasgang.vteximg.com.br/arquivos/ids/289158/34200091-JAQUETA-JEANS-BLUE-MEDIO-RASGOS-1.jpg?v=637514962528930000"
      ,
      price: 25.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Calça Jeans",
      category: "Moda Masculina",
      imageUrl: 
        "https://cf.shopee.com.br/file/fed19a35eb976e8d0a7cc92193915660"
      ,
      price: 33.99,
      isRecommended: true,
      isPopular: false,
    ),
    // modelo para moda feminina
    Product(
      name: "Cropped Preto",
      category: "Moda Feminina",
      imageUrl: 
        "https://cf.shopee.com.br/file/56f9412ee0c951e5530e297c6289cb26"
      ,
      price: 15.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Calça Xadrez",
      category: "Moda Feminina",
      imageUrl: 
        "https://a-static.mlcdn.com.br/618x463/calca-xadrez-feminina-jogger-bengaline-preta-tamanho-p-machete-moda-feminina/machetemodafeminina/8dbaa6fa487711ebadfb4201ac1850d0/b7b236e7c4f9b28104e76f23d2cb7b8c.jpeg"
      ,
      price: 8.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Vestido com babados",
      category: "Moda Feminina",
      imageUrl: 
        "https://m.media-amazon.com/imageUrl/I/61KRGkTLDRL._AC_SX342_.jpg"
      ,
      price: 5.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Blusa rosa com babados",
      category: "Moda Feminina",
      imageUrl: 
        "https://ozllo.vteximg.com.br/arquivos/ids/258450-1000-1263/image-5e73669eacb94376a79bc2d7c016cea1.jpg?v=637607519327270000"
      ,
      price: 20.90,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}

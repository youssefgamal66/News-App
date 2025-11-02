import '../../../core/const/AppAssets.dart';

class CardList {
  final String name;
  final String photo;
  final String id;

  CardList( {required this.name, required this.photo, required this.id });

  static List<CardList> iteam = [
    CardList(name: "General", photo: AppAssets.earth_card,id:'general'),
    CardList(name: "Business", photo: AppAssets.money_card, id: 'business'),
    CardList(name: "Sport", photo: AppAssets.messi_card, id: 'sports'),
    CardList(name: "Entertainment", photo: AppAssets.popcorn_card, id: 'entertainment'),
    CardList(name: "Health", photo: AppAssets.headphone_card, id: 'health'),
    CardList(name: "Science", photo: AppAssets.micro_card, id: 'science'),
    CardList(name: "Technology", photo: AppAssets.arduino_card, id: 'technology'),
  ];
}

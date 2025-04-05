class MoviesCloudStore {
  static const String collectionName = 'moviesId';
  int? id;
  String? name;
  String? date;
  double? rate;
  String? imgPath;

  MoviesCloudStore({this.id, this.date, this.name, this.imgPath, this.rate});

  MoviesCloudStore.fromFireStore(Map<String, dynamic>? data)
    : this(
        id: data?["id"],
        date: data?["date"],
        name: data?["name"],
        imgPath: data?["imgPath"],
        rate: data?["rate"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "date": date,
      "name": name,
      "imgPath": imgPath,
      "rate": rate,
    };
  }
}

class GuruModel {
  int? jumlah;

  GuruModel({
    required this.jumlah,
  });

  factory GuruModel.fromJson(Map<String, dynamic> object) {
    return GuruModel(
      jumlah: object['jumlah'],
    );
  }
}

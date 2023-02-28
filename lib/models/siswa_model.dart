class SiswaModel {
  int? jumlah;

  SiswaModel({
    required this.jumlah,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> object) {
    return SiswaModel(
      jumlah: object['jumlah'],
    );
  }
}

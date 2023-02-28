class KurikulumModel {
  int? id;
  String? kurikulum, keterangan;

  KurikulumModel({
    required this.id,
    required this.kurikulum,
    required this.keterangan,
  });

  factory KurikulumModel.fromJson(Map<String, dynamic> object) {
    return KurikulumModel(
      id: object['id'],
      kurikulum: object['kurikulum'],
      keterangan: object['keterangan'],
    );
  }
}

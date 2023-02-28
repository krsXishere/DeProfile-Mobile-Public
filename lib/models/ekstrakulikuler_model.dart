class EkstrakulikulerModel {
  int? id, sekolahId;
  String? jenis, nama;

  EkstrakulikulerModel({
    required this.id,
    required this.jenis,
    required this.nama,
    required this.sekolahId,
  });

  factory EkstrakulikulerModel.fromJson(Map<String, dynamic> object) {
    return EkstrakulikulerModel(
      id: object['id'],
      jenis: object['jenis'],
      nama: object['nama'],
      sekolahId: object['sekolah_id'],
    );
  }
}

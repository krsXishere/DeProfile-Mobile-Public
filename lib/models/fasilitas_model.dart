class FasilitasModel {
  int? id, sekolahId;
  String? nama, jenis, keterangan;

  FasilitasModel({
    required this.id,
    required this.nama,
    required this.jenis,
    required this.keterangan,
    required this.sekolahId,
  });

  factory FasilitasModel.fromJson(Map<String, dynamic> object) {
    return FasilitasModel(
      id: object['id'],
      nama: object['nama'],
      jenis: object['jenis'],
      keterangan: object['keterangan'],
      sekolahId: object['sekolah_id'],
    );
  }
}

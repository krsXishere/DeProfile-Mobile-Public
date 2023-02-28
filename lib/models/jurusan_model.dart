class JurusanModel {
  int? id, kurikulumId, sekolahId;
  String? jurusan, keterangan, tahun, akreditasi;

  JurusanModel({
    required this.id,
    required this.jurusan,
    required this.keterangan,
    required this.tahun,
    required this.kurikulumId,
    required this.sekolahId,
    required this.akreditasi,
  });

  factory JurusanModel.fromJson(Map<String, dynamic> object) {
    return JurusanModel(
      id: object['id'],
      jurusan: object['jurusan'],
      keterangan: object['keterangan'],
      tahun: object['tahun'],
      kurikulumId: object['kurikulum_id'],
      sekolahId: object['sekolah_id'],
      akreditasi: object['akreditasi'],
    );
  }
}

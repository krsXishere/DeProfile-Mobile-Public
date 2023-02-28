class PrestasiModel {
  int? id, sekolahId;
  String? nama, jenisPrestasi, tingkat, keterangan;

  PrestasiModel({
    required this.id,
    required this.nama,
    required this.jenisPrestasi,
    required this.tingkat,
    required this.keterangan,
    required this.sekolahId,
  });

  factory PrestasiModel.fromJson(Map<String, dynamic> object) {
    return PrestasiModel(
      id: object['id'],
      nama: object['nama'],
      jenisPrestasi: object['jenis_prestasi'],
      tingkat: object['tingkat'],
      keterangan: object['keterangan'],
      sekolahId: object['sekolah_id'],
    );
  }
}

class GaleriModel {
  int? id, sekolahId;
  String? judul, deskripsi, image;

  GaleriModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.image,
    required this.sekolahId,
  });

  factory GaleriModel.fromJson(Map<String, dynamic> object) {
    return GaleriModel(
      id: object['id'],
      judul: object['judul'],
      deskripsi: object['deskripsi'],
      image: object['image'],
      sekolahId: object['sekolah_id'],
    );
  }
}

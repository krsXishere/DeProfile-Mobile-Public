class SekolahModel {
  String? nss,
      npsn,
      nama,
      alamat,
      rw,
      rt,
      noTelpon,
      noFax,
      latLong,
      image,
      email,
      kepalaSekolah;
  int? id, idDesa;

  SekolahModel({
    required this.id,
    required this.nss,
    required this.npsn,
    required this.nama,
    required this.alamat,
    required this.idDesa,
    required this.rw,
    required this.rt,
    required this.noTelpon,
    required this.noFax,
    required this.latLong,
    required this.image,
    required this.email,
    required this.kepalaSekolah,
  });

  factory SekolahModel.fromJson(Map<String, dynamic> object) {
    return SekolahModel(
      id: object['id'],
      nss: object['nss'],
      npsn: object['npsn'],
      nama: object['nama'],
      alamat: object['alamat'],
      idDesa: object['idDesa'],
      rw: object['rw'],
      rt: object['rt'],
      noTelpon: object['no_telpon'],
      noFax: object['no_fax'],
      latLong: object['lat_long'],
      image: object['image'],
      email: object['email'],
      kepalaSekolah: object['kepala_sekolah'],
    );
  }
}

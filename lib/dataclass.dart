class Plant {
  final String panjang;
  final String jumlah;

  Plant({required this.panjang, required this.jumlah});

  Map<String, dynamic> toJson() {
    return {
      "panjang": panjang,
      "batang": jumlah,
    };
  }

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      jumlah: json['jumlah'],
      panjang: json['panjang'],
    );
  }
}

class AutocompleteData {
  final int id;
  final String longitude;
  final String latitude;
  final String address;
  final String city;
  final String area;
  final int postCode;
  final String pType;
  final String subType;
  final String district;
  final String uCode;

  AutocompleteData({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.city,
    required this.area,
    required this.postCode,
    required this.pType,
    required this.subType,
    required this.district,
    required this.uCode,
  });

  factory AutocompleteData.fromJson(Map<String, dynamic> json) {
    return AutocompleteData(
      id: json['id'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      address: json['address'] ,
      city: json['city'],
      area: json['area'] ,
      postCode: json['postCode'] ,
      pType: json['pType'] ,
      subType: json['subType'],
      district: json['district'],
      uCode: json['uCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
      'city': city,
      'area': area,
      'postCode': postCode,
      'pType': pType,
      'subType': subType,
      'district': district,
      'uCode': uCode,
    };
  }
}

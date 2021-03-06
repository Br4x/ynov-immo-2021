part of swagger.api;

class RealEstatePropal {
  /* Id de la proposition */
  int id;
  
/* Id du booker */
  int idBooker;
  
/* Id du visitor */
  int idBuyer;
  
/* Id du bien */
  int idRealEstate;
  
/* Id du propriétaire */
  int idVendor;
  
/* Montant de la proposition */
  double price;
  
/* Prénom de l'acheteur */
  String buyerFirstName;
  
/* Nom de l'acheteur */
  String buyerLastName;
  
/* Adresse de l'acheteur */
  String buyerAddress;
  
/* Code postal de l'acheteur */
  String buyerZipCode;
  
/* Ville de l'acheteur */
  String buyerCity;
  
/* Date d'expiration de l'offre */
  DateTime expirationDate;
  
/* Est accepté? */
  int isAccepted;
  
  RealEstatePropal();

  @override
  String toString() {
    return 'RealEstatePropal[id=$id, idBooker=$idBooker, idBuyer=$idBuyer, idRealEstate=$idRealEstate, idVendor=$idVendor, price=$price, buyerFirstName=$buyerFirstName, buyerLastName=$buyerLastName, buyerAddress=$buyerAddress, buyerZipCode=$buyerZipCode, buyerCity=$buyerCity, expirationDate=$expirationDate, isAccepted=$isAccepted, ]';
  }

  RealEstatePropal.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    idBooker =
        json['id_booker']
    ;
    idBuyer =
        json['id_buyer']
    ;
    idRealEstate =
        json['id_real_estate']
    ;
    idVendor =
        json['id_vendor']
    ;
    price =
        json['price']
    ;
    buyerFirstName =
        json['buyer_first_name']
    ;
    buyerLastName =
        json['buyer_last_name']
    ;
    buyerAddress =
        json['buyer_address']
    ;
    buyerZipCode =
        json['buyer_zip_code']
    ;
    buyerCity =
        json['buyer_city']
    ;
    expirationDate = json['expiration_date'] == null ? null : DateTime.parse(json['expiration_date']);
    isAccepted =
        json['is_accepted']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_booker': idBooker,
      'id_buyer': idBuyer,
      'id_real_estate': idRealEstate,
      'id_vendor': idVendor,
      'price': price,
      'buyer_first_name': buyerFirstName,
      'buyer_last_name': buyerLastName,
      'buyer_address': buyerAddress,
      'buyer_zip_code': buyerZipCode,
      'buyer_city': buyerCity,
      'expiration_date': expirationDate == null ? '' : expirationDate.toUtc().toIso8601String(),
      'is_accepted': isAccepted
     };
  }

  static List<RealEstatePropal> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new RealEstatePropal.fromJson(value)).toList();
  }

  static Map<String, RealEstatePropal> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RealEstatePropal>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RealEstatePropal.fromJson(value));
    }
    return map;
  }
}


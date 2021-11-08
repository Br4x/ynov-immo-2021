import '../../../api.dart';

class IndicationsController{

  void sendData(RealEstatePropalsBuyerIndication body){
    var api_instance = new RealEstatePropalsBuyerIndicationApi();
    try {
      var result = api_instance.realEstatePropalsBuyerIndicationPost(body);
      print(result);
    } catch (e) {
      print("Exception when calling RealEstatePropalsBuyerIndicationApi->realEstatePropalsBuyerIndicationPost: $e\n");
    }
  }

}
part of swagger.api;



class RealEstatePropalsBuyerIndicationApi {
  final ApiClient apiClient;

  RealEstatePropalsBuyerIndicationApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// get all real-estate-propals-buyer-indication by pagination
  ///
  /// 
  Future<List<RealEstatePropalsBuyerIndicationPagination>> realEstatePropalsBuyerIndicationGet({ List<String> where, String fields, String order, int offset, int limit }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/real-estate-propals-buyer-indication".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(where != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("multi", "where", where));
    }
    if(fields != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "fields", fields));
    }
    if(order != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "order", order));
    }
    if(offset != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "offset", offset));
    }
    if(limit != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "limit", limit));
    }
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<RealEstatePropalsBuyerIndicationPagination>') as List).map((item) => item as RealEstatePropalsBuyerIndicationPagination).toList();
    } else {
      return null;
    }
  }
  /// Destroy a real-estate-propals-buyer-indication by ID
  ///
  /// delete a real-estate-propals-buyer-indication by ID
  Future<ApiResponse> realEstatePropalsBuyerIndicationIdDelete(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/real-estate-propals-buyer-indication/{Id}".replaceAll("{format}","json").replaceAll("{" + "Id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'DELETE',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'ApiResponse') as ApiResponse ;
    } else {
      return null;
    }
  }
  /// get a real-estate-propals-buyer-indication by ID
  ///
  /// get a real-estate-propals-buyer-indication by ID
  Future<RealEstatePropalsBuyerIndication> realEstatePropalsBuyerIndicationIdGet(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/real-estate-propals-buyer-indication/{Id}".replaceAll("{format}","json").replaceAll("{" + "Id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'RealEstatePropalsBuyerIndication') as RealEstatePropalsBuyerIndication ;
    } else {
      return null;
    }
  }
  /// update real-estate-propals-buyer-indication
  ///
  /// update real-estate-propals-buyer-indication
  Future<ApiResponse> realEstatePropalsBuyerIndicationPatch(RealEstatePropalsBuyerIndication body) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw new ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/real-estate-propals-buyer-indication".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'PATCH',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'ApiResponse') as ApiResponse ;
    } else {
      return null;
    }
  }
  /// create real-estate-propals-buyer-indication
  ///
  /// create real-estate-propals-buyer-indication
  Future<ApiResponse> realEstatePropalsBuyerIndicationPost(RealEstatePropalsBuyerIndication body) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw new ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/real-estate-propals-buyer-indication".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'ApiResponse') as ApiResponse ;
    } else {
      return null;
    }
  }
}

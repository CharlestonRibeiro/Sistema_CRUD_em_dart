abstract class IRestClient {
  Future getAllData({required String url});
  Future postData({required String url, required Map<String, dynamic> data});
  Future deleteData({required String url});
  Future putData({required String url, required Map<String, dynamic> data});
}
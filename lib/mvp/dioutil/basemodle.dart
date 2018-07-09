class BaseModel<T>{

  final int statusCode;

  final String statusMsg;

  final  T data;

  const BaseModel({this.statusCode, this.statusMsg, this.data});

}

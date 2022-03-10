class BaseResponse {
  final String message;
  final int code;
  final Map<String, dynamic> data;

  BaseResponse(this.message, this.code, this.data);
  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        json['message'] as String,
        json['code'] as int,
        json['data'] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
      <String, dynamic>{
        'message': instance.message,
        'code': instance.code,
        'data': instance.data,
      };
}

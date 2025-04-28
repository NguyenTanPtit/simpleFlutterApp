
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';


@JsonSerializable()
class LoginRequest extends Equatable{
  String username;
  String password;
  int expiresInMins = 30;

  LoginRequest(this.username, this.password, this.expiresInMins);

  factory LoginRequest.fromJson(Map<String,dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
    username, password, expiresInMins
  ];
}
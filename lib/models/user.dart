import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum Gender { male, female, other }

const String userInfoKey = 'userInfo';

abstract interface class IUser {
  String? get names;
  String? get lastNames;
  String? get phone;
  String? get email;
  DateTime? get birthDate;
  Gender? get gender;
}

@JsonSerializable()
class UserInfo extends Equatable implements IUser {
  const UserInfo({this.names, this.lastNames, this.phone, this.email, this.birthDate, this.gender});

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  @override
  final String? names;

  @override
  final String? lastNames;

  @override
  final String? email;

  @override
  final String? phone;

  @override
  final DateTime? birthDate;

  @override
  final Gender? gender;

  UserInfo copyWith({
    String? names,
    String? lastNames,
    String? phone,
    String? email,
    DateTime? birthDate,
    Gender? gender,
  }) {
    return UserInfo(
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
    );
  }

  String? birtDateFormated() =>
      birthDate != null ? DateFormat('dd/MM/yyyy').format(birthDate!) : null;

  int? currentAge() {
    if (birthDate == null) {
      return null;
    }

    // * Tambien podriamos usar la libreria timeago
    final DateTime now = DateTime.now();
    final DateTime birth = birthDate!;
    int edad = now.year - birth.year;

    // Ajustar si aún no ha cumplido años este año
    if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
      edad--;
    }

    return edad;
  }

  @override
  List<Object?> get props => <Object?>[names, lastNames, email, phone, birthDate, gender];
}

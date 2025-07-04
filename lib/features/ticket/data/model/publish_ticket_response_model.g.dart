// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_ticket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishTicketResponseModel _$PublishTicketResponseModelFromJson(
  Map<String, dynamic> json,
) => PublishTicketResponseModel(
  status: json['status'] as String,
  data: TicketData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PublishTicketResponseModelToJson(
  PublishTicketResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  houseType: $enumDecode(_$HouseTypeEnumMap, json['houseType']),
  serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
  location: json['location'] as String,
  direction: json['direction'] as String,
  lowPrice: (json['lowPrice'] as num).toDouble(),
  highPrice: (json['highPrice'] as num).toDouble(),
  area: (json['area'] as num).toDouble(),
  numberOfBed: (json['numberOfBed'] as num).toInt(),
  numberOfRooms: (json['numberOfRooms'] as num).toInt(),
  numberOfBathrooms: (json['numberOfBathrooms'] as num).toInt(),
  dateTime: json['dateTime'] as String,
  client: Client.fromJson(json['client'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketDataToJson(TicketData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'houseType': _$HouseTypeEnumMap[instance.houseType]!,
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
      'location': instance.location,
      'direction': instance.direction,
      'lowPrice': instance.lowPrice,
      'highPrice': instance.highPrice,
      'area': instance.area,
      'numberOfBed': instance.numberOfBed,
      'numberOfRooms': instance.numberOfRooms,
      'numberOfBathrooms': instance.numberOfBathrooms,
      'dateTime': instance.dateTime,
      'client': instance.client,
    };

const _$HouseTypeEnumMap = {
  HouseType.upperFloor: 'UPPER_FLOOR',
  HouseType.lowerFloor: 'LOWER_FLOOR',
};

const _$ServiceTypeEnumMap = {ServiceType.buy: 'BUY', ServiceType.rent: 'RENT'};

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
  id: (json['id'] as num).toInt(),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  favorites: json['favorites'] as List<dynamic>,
  following: json['following'] as List<dynamic>,
);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'favorites': instance.favorites,
  'following': instance.following,
};

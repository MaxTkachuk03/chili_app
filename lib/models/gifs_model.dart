import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gifs_model.g.dart';

@JsonSerializable()
class GifsModel extends Equatable {
    const GifsModel({
    // required this.images,
    // required this.fixedHeight,
    required this.url,
  });

  // final String images;
  // @JsonKey(name: "fixed_height")
  // final String fixedHeight;
  final String url;

  factory GifsModel.fromJson(Map<String, dynamic> json) => _$GifsModelFromJson(json);
  Map<String, dynamic> toJson() => _$GifsModelToJson(this);


  @override
  List<Object> get props => [ url,];
}
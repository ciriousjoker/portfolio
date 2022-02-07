import "package:json_annotation/json_annotation.dart";

part "project.model.g.dart";

@JsonSerializable()
class ProjectModel {
  final String title;
  final String? githubName;
  late String description;
  final String learningsTldr;
  late String learnings;
  final String? urlImage;
  final String? urlDownload;
  final String? urlDemo;
  final String? urlPlaystore;
  final String? urlWebsite;

  // filename in assets/icons/*
  final String icon;

  /// Unix epoch timestamp
  final int timestamp;

  /// List of TagIDs
  final List<String> tags;

  /// List of PlatformIDs
  final List<String> platforms;

  ProjectModel({
    required this.title,
    required this.timestamp,
    required this.icon,
    this.githubName,
    required List<String> description,
    required this.learningsTldr,
    required List<String> learnings,
    this.urlImage,
    this.urlDemo,
    this.urlPlaystore,
    this.urlDownload,
    this.urlWebsite,
    this.platforms = const [],
    this.tags = const [],
  }) {
    this.description = description.join();
    this.learnings = learnings.join();
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

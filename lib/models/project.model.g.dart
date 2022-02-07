// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      title: json['title'] as String,
      timestamp: json['timestamp'] as int,
      icon: json['icon'] as String,
      githubName: json['githubName'] as String?,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      learningsTldr: json['learningsTldr'] as String,
      learnings:
          (json['learnings'] as List<dynamic>).map((e) => e as String).toList(),
      urlImage: json['urlImage'] as String?,
      urlDemo: json['urlDemo'] as String?,
      urlPlaystore: json['urlPlaystore'] as String?,
      urlDownload: json['urlDownload'] as String?,
      urlWebsite: json['urlWebsite'] as String?,
      platforms: (json['platforms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'githubName': instance.githubName,
      'description': instance.description,
      'learningsTldr': instance.learningsTldr,
      'learnings': instance.learnings,
      'urlImage': instance.urlImage,
      'urlDownload': instance.urlDownload,
      'urlDemo': instance.urlDemo,
      'urlPlaystore': instance.urlPlaystore,
      'urlWebsite': instance.urlWebsite,
      'icon': instance.icon,
      'timestamp': instance.timestamp,
      'tags': instance.tags,
      'platforms': instance.platforms,
    };

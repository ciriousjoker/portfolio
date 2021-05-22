// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsModel _$ProjectsModelFromJson(Map<String, dynamic> json) {
  return ProjectsModel(
    projects: (json['projects'] as List<dynamic>)
        .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProjectsModelToJson(ProjectsModel instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };

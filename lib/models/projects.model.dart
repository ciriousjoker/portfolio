import "package:json_annotation/json_annotation.dart";
import "package:portfolio/models/project.model.dart";

part "projects.model.g.dart";

@JsonSerializable()
class ProjectsModel {
  final List<ProjectModel> projects;

  ProjectsModel({required this.projects});
  factory ProjectsModel.fromJson(Map<String, dynamic> json) => _$ProjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectsModelToJson(this);
}

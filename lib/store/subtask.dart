import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'subtask.g.dart';

@HiveType(typeId: 2)
class Subtask = _SubtaskBase with _$Subtask;

abstract class _SubtaskBase with Store {
  _SubtaskBase({
    required this.title,
  });

  @HiveField(0)
  @observable
  String title;

  @HiveField(1)
  @observable
  bool isDone = false;


}